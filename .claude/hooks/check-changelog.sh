#!/usr/bin/env bash
# PreToolUse hook — block `git push` unless CHANGELOG.md has been updated.
#
# Gate: the hook passes if CHANGELOG.md differs from the server copy in
# any way — working tree, staged, or committed. That's the intent of the
# rule ("every push must be preceded by a CHANGELOG update") and it also
# tolerates compound commands like `git add && git commit && git push`,
# where the hook would otherwise run before the add/commit took effect.
#
# Exception: tag-only pushes skip the gate — `git push origin 1.0.0` or
# `git push --tags` publishes a pointer to commits whose CHANGELOG was
# already gated when those commits were pushed. Detected when either
# (a) the command includes `--tags`, or (b) any whitespace-separated
# token in the command resolves to an existing local tag.
#
# Comparison target, in priority order:
#   1. origin/main   — the canonical main-branch pointer we actually push to
#   2. @{u}          — the current branch's upstream (covers non-main branches)
#   3. HEAD          — repo has no remote at all (first-push bootstrap);
#                      treat any presence of CHANGELOG.md as enough.
#
# On miss: emit a PreToolUse permission-deny JSON so Claude refuses the
# push and surfaces the reason.

set +e

# Read the PreToolUse payload to inspect the actual push command.
payload=$(cat)
cmd=$(printf '%s' "$payload" | jq -r '.tool_input.command // ""')

# Scope the rule to this repo. The hook is configured at the project
# level, but Claude Code applies it to any `git push` run in this
# session — including pushes from temp clones of unrelated repos
# (e.g. fork clones used to submit PRs elsewhere). When the current
# git repo's origin URL doesn't point at nous-obsidian-theme, the
# CHANGELOG rule doesn't apply; let the push through.
origin_url=$(git config --get remote.origin.url 2>/dev/null || echo "")
case "$origin_url" in
  *nous-obsidian-theme*) ;;
  *) exit 0 ;;
esac

# Tag-only-push short-circuit.
is_tag_push=false
if printf '%s' "$cmd" | grep -Eq '(^|[[:space:]])--tags([[:space:]]|$)'; then
  is_tag_push=true
else
  for tok in $cmd; do
    if git rev-parse --verify "refs/tags/$tok" >/dev/null 2>&1; then
      is_tag_push=true
      break
    fi
  done
fi

if [ "$is_tag_push" = "true" ]; then
  exit 0
fi

changelog="CHANGELOG.md"
has_changelog=false

if git rev-parse --verify origin/main >/dev/null 2>&1; then
  if ! git diff --quiet origin/main -- "$changelog" 2>/dev/null; then
    has_changelog=true
  fi
elif git rev-parse --abbrev-ref '@{u}' >/dev/null 2>&1; then
  if ! git diff --quiet '@{u}' -- "$changelog" 2>/dev/null; then
    has_changelog=true
  fi
else
  # No remote pointer at all — first push. Let it through if the file
  # exists in the working tree or is tracked.
  if [ -f "$changelog" ] || git ls-files --error-unmatch "$changelog" >/dev/null 2>&1; then
    has_changelog=true
  fi
fi

if [ "$has_changelog" = "true" ]; then
  exit 0
fi

jq -n --arg reason "Project rule (see CLAUDE.md): every git push must be preceded by a CHANGELOG.md update. Add an entry under [Unreleased] (or the appropriate release section) covering the pushed commits, then retry the push. If the change really is trivial, add a one-line entry under Unreleased > Changed — the rule is 'an entry exists,' not 'the entry is long.'" '{
  hookSpecificOutput: {
    hookEventName: "PreToolUse",
    permissionDecision: "deny",
    permissionDecisionReason: $reason
  }
}'
exit 0
