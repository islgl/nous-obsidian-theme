# Changelog

All notable changes to **Nous** are documented here.
The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and the project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed
- **CHANGELOG push hook** — relaxed from "CHANGELOG must be staged or in unpushed commits" to "CHANGELOG must differ from origin/main in any way (working tree, staged, or committed)." Fixes false negatives when Claude chains `git add && git commit && git push` in one shell call — the hook now fires on the intent of the rule, not on mid-pipeline filesystem state.

### Fixed
- **Mermaid dark-mode legibility** — nodes now lift to `--nous-warm-sand` in dark mode instead of `--background-primary-alt`, so node cards read as cards rather than as dark holes punched into an already-dark page. Cluster rects, sequence notes, and actor surfaces get the same treatment. Gantt grid lines switch to `--nous-ring-warm` in dark mode too.
- **Mermaid edge-label legibility** — edge labels (`yes` / `no` branch guards, sequence-diagram messages, ER relationship verbs) had become unreadable after the background rect was stripped — muted italic text directly on top of the connector stroke. Replaced with a typography-halo: SVG `<text>` uses `paint-order: stroke fill` with a 3px stroke in the page background color (the stroke is painted *under* the glyph fill so it reads as a halo, not an outline); HTML labels rendered via `foreignObject` get an 8-direction `text-shadow` in the same color. Result: no visible box, text still floats clear over the stroke. Also upgraded the text itself from muted-italic to normal-weight-500 at 0.9em so it reads as caption, not afterthought.
- **Mermaid ER harmony (actually applied this time)** — the previous attempt used selectors like `.mermaid .er .entityBox` (descendant combinator), assuming Mermaid wrapped the diagram in a `<g class="er">` parent. It doesn't: Mermaid writes `class="er entityBox"` as two classes on the *same* element, so the descendant selector matched nothing and the rules were silently dropped. Fixed by targeting each class directly (`.mermaid .entityBox`, `.mermaid .relationshipLine`, etc.) and bumping specificity with `.markdown-preview-view` to outrank Mermaid's inline `<style>`. ER cardinality markers (one / many / zero-or-one) in `<defs><marker>` now also get the warm charcoal fill instead of defaulting to black.
- **Mermaid pie harmony (actually applied this time)** — same class-shape mistake: slices in v10+ are all `<path class="pieCircle">` with colors applied via a `fill="…"` SVG attribute, not via `.pieN` classes. Recolor now works by targeting `.markdown-preview-view .mermaid path.pieCircle:nth-of-type(7n+k)` (CSS `!important` beats a presentation attribute).
- **Mermaid pie legend** — the first attempt assumed Mermaid emitted `<rect class="legend0">` on the swatches; the rects actually have *no class* — color lives in an inline `style="fill: rgb(…); stroke: rgb(…)"` on the rect, with `.legend` sitting on the parent `<g>`. New selector is `.mermaid g.legend:nth-of-type(7n+k) > rect` and overrides both `fill` and `stroke` (Mermaid sets both inline). The decorative `circle.pieOuterCircle` border also gets a transparent fill + warm hairline so it stops fighting the slice palette.

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
