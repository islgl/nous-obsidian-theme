#!/usr/bin/env bash
# PreToolUse hook — block `git push` unless CHANGELOG.md has been updated.
#
# Gate logic: allow the push if CHANGELOG.md is either
#   (a) in the commits being pushed (diff against @{u}, or origin/main as a
#       fallback when the branch has no upstream yet), OR
#   (b) currently staged (user is mid-amend, about to squash the changelog
#       entry into an existing commit).
#
# When neither is true, emit a PreToolUse permission-deny JSON so Claude
# refuses the git push and surfaces the reason to the operator.

set +e  # grep exits 1 on no matches — don't let that kill us under pipefail

changelog_file="CHANGELOG.md"

staged_files=$(git diff --cached --name-only 2>/dev/null)

# Prefer the tracked upstream; fall back to origin/main if the branch has
# no upstream configured yet.
if git rev-parse --abbrev-ref '@{u}' >/dev/null 2>&1; then
  pushed_files=$(git diff --name-only '@{u}..HEAD' 2>/dev/null)
elif git rev-parse --verify origin/main >/dev/null 2>&1; then
  pushed_files=$(git diff --name-only 'origin/main..HEAD' 2>/dev/null)
else
  # No upstream and no origin/main — this is the very first push of a new
  # repo. Look at HEAD's own diff against the empty tree so all files are
  # considered "being pushed."
  pushed_files=$(git ls-tree -r --name-only HEAD 2>/dev/null)
fi

has_changelog=false
if printf '%s\n' "$staged_files" | grep -Fxq "$changelog_file"; then
  has_changelog=true
fi
if printf '%s\n' "$pushed_files" | grep -Fxq "$changelog_file"; then
  has_changelog=true
fi

if [ "$has_changelog" = "true" ]; then
  exit 0
fi

jq -n --arg reason "Project rule (see CLAUDE.md): every git push must be preceded by a CHANGELOG.md update. Add an entry under [Unreleased] (or the appropriate release section) covering the pushed commits, stage it or fold it into a commit, then retry the push. If the change really is trivial, add a one-line entry under Unreleased > Changed — the rule is 'an entry exists,' not 'the entry is long.'" '{
  hookSpecificOutput: {
    hookEventName: "PreToolUse",
    permissionDecision: "deny",
    permissionDecisionReason: $reason
  }
}'
exit 0
