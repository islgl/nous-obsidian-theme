# Changelog

All notable changes to **Nous** are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and the project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
- **Brand assets** — mark, inverse mark, lockup, OG image (`assets/`).
- **Design spec** — `docs/DESIGN.md` with palette, type hierarchy, spacing, component principles.

### Known limitations
- Third-party plugin UIs (Dataview, Kanban, Advanced Tables, etc.) are not yet fully covered.
- Variable names may be renamed before 1.0.0.
- Not yet submitted to the Obsidian community theme catalog — install manually from the Releases page.

[Unreleased]: https://github.com/islgl/nous-obsidian-theme/compare/v1.0.0-alpha.1...HEAD
[1.0.0-alpha.1]: https://github.com/islgl/nous-obsidian-theme/releases/tag/v1.0.0-alpha.1
