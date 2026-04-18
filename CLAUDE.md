# Project rules — nous-obsidian-theme

## Release hygiene

- **Every `git push` must be preceded by a `CHANGELOG.md` update.** Before running `git push`, confirm that `CHANGELOG.md` has an entry under `[Unreleased]` (or the appropriate versioned section) covering the commits being pushed. If it doesn't, update `CHANGELOG.md` and fold that into the commit series before pushing.
  - Trivial/internal changes still get a one-line `Unreleased > Changed` entry — the rule is "an entry exists," not "the entry is long."
  - Amends and force-pushes follow the same rule: the final pushed state must have CHANGELOG covering it.

## Asset layout

- Brand marks, lockup, OG image live in `assets/logo/`.
- README preview screenshots live in `assets/screenshots/`.
- Raw/unedited screenshot exports live in the repo-root `screenshots/` directory and are gitignored (canonical versions are promoted into `assets/screenshots/`).
