# Changelog

All notable changes to **Nous** are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and the project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Removed
- `docs/` directory (including `DESIGN.md`) — the visual direction is now carried entirely by the theme + README; design-doc maintenance was a tax with no reader.
- README "Design reference" section and the prominent "Inspired by Claude" disclaimer blockquote — the Acknowledgments section at the bottom still carries the credit and the not-affiliated note.
- GitHub stars badge — the badge row reads cleaner without it.

### Changed
- README badge row recolored with a warmer spread (terracotta / tan / deep brown / light terracotta) instead of one flat terracotta.
- README preview is now a single 2×3 table of all six screenshots (hero, dark, paper, handwriting, callouts, tables), dropping the split hero + grid + tables-below layout.

### Added
- `assets/` restructured into `assets/logo/` (brand marks, lockup, OG image) and `assets/screenshots/` (preview gallery).
- `screenshots/tables.png` — booktabs + math preview added to README.
- `screenshots/callouts.png` — correct callout gallery image (the previous file mislabeled as callouts was actually the tables + math shot; now filed as `tables.png`).
- README badges — release, license, Obsidian version, light/dark modes, stars.
- Explicit **Acknowledgments** section in README crediting Claude / Anthropic, the LaTeX tradition, and the Obsidian community.
- **Dataview plugin coverage** (`theme.css` §19c) — TABLE queries inherit the booktabs rule system with small-caps headers and warm-tinted sort arrows; LIST queries get a terracotta `::marker` and serif body; TASK queries keep the body font; inline fields render as a small-caps key with a thin warm divider (replacing the default blue pill); inline queries render as italic terracotta; Dataview error boxes use a left warning rule on a transparent surface instead of the default solid-red block.
- `CLAUDE.md` at repo root documenting project rules (CHANGELOG gate before every push, asset layout).
- **`.claude/settings.json` + `.claude/hooks/check-changelog.sh`** — committed Claude Code hook that enforces the CHANGELOG-before-push rule. A `PreToolUse` hook on `Bash` matching `git push*` checks that `CHANGELOG.md` is either staged or included in the commits ahead of the upstream; if neither, the push is blocked with a message pointing to `CLAUDE.md`. `.gitignore` is loosened so `.claude/settings.json` and `.claude/hooks/` are tracked while `.claude/settings.local.json` stays personal.

### Changed
- README header now includes the inspiration statement up front and asset paths have been updated to the new `assets/logo/` and `assets/screenshots/` locations.

## [1.0.0-alpha.1] — 2026-04-18

First public alpha.

### Added
- **Core theme** (`theme.css`) — warm parchment palette (`#f5f4ed` canvas, `#c96442` terracotta accent), near-black `#141413` dark variant, serif body in both edit and reading view.
- **LaTeX booktabs tables** — 2px top/bottom rules, 1px mid rule, no verticals, small-caps header row, tabular lining figures.
- **Theorem-style callouts** — 13+ built-in Obsidian callouts restyled, plus custom `[!theorem]` / `[!lemma]` / `[!proposition]` / `[!corollary]` / `[!proof]` / `[!definition]` / `[!remark]` / `[!example]`; `[!proof]` auto-appends ∎.
- **Mermaid recoloring** — flowchart / sequence / state / class / gantt / pie / ER diagrams mapped to the warm palette.
- **Ring-shadow depth system** — inset / 1px rings in warm grays in place of drop shadows.
- **Content typography** — small-caps at H5/H6, italic at H4, tight display letter-spacing on the inline title, old-style figures in body text.
- **Style Settings integration** — fonts, body size, line height, reading column width, justify toggle, numbered-headings toggle, drop-cap toggle, H5/H6 small-caps toggle.
- **Optional snippets** (in `snippets/`):
  - `nous-paper-mode.css` — LaTeX article jacket, triggered by `cssclasses: [paper]` (§-numbered headings, drop cap, justified body, figure/table captions, § hr ornament).
  - `nous-handwriting.css` — quill-and-parchment jacket, triggered by `cssclasses: [handwriting]` (Petit Formal Script + Xingkai SC 行楷, flower ornaments ❃ ✿ ❁ on H1/H2/H3, centered pull-quote blockquotes).
  - `nous-theorem-counters.css` — amsthm-style auto-numbering for `theorem` / `lemma` / `proposition` / `corollary`.
  - `nous-classical-figures.css` — OpenType old-style figures in body, tabular lining figures in tables.
- **Mixed-language typography** — CJK `size-adjust` so Chinese lines align to Latin x-height in mixed headings.
- **Brand assets** — mark, inverse mark, lockup, OG image (`assets/logo/`).

### Known limitations
- Third-party plugin UIs (Dataview, Kanban, Advanced Tables, etc.) are not yet fully covered.
- Variable names may be renamed before 1.0.0.
- Not yet submitted to the Obsidian community theme catalog — install manually from the Releases page.

[Unreleased]: https://github.com/islgl/nous-obsidian-theme/compare/v1.0.0-alpha.1...HEAD
[1.0.0-alpha.1]: https://github.com/islgl/nous-obsidian-theme/releases/tag/v1.0.0-alpha.1
