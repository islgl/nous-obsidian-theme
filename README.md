# Nous — An Obsidian theme

> **Warm parchment, serif headlines, theorem-style callouts** —
> Claude's editorial aesthetic fused with LaTeX academic typography.

Nous (νοῦς, *mind / intellect*) turns an Obsidian vault into a scholar's notebook: a parchment-toned canvas, a medium-weight serif headline voice, booktabs tables, theorem-like callouts, and per-note "paper" / "handwriting" modes you can flip on with a single frontmatter flag.

---

## Preview

*(Screenshot pending — see `docs/DESIGN.md` for the visual spec.)*

---

## Install

### Manual (recommended while alpha)

1. Download the latest release of `theme.css` and `manifest.json` from the [Releases page](https://github.com/islgl/nous-obsidian-theme/releases).
2. Put them in `YourVault/.obsidian/themes/Nous/`.
3. Obsidian → **Settings → Appearance → Themes → Nous**.

### Community store

Not yet listed. Will apply once the theme stabilizes past alpha.

---

## Features

- **Warm Claude palette** — parchment `#f5f4ed` canvas, terracotta `#c96442` accent, every gray carries a yellow-brown undertone, no cool blue-grays anywhere
- **Serif body in edit *and* reading view** — Crimson Pro / EB Garamond / Songti SC, so you write on paper, not in a chat box
- **LaTeX booktabs tables** — top & bottom 2px rules, 1px mid rule, no verticals, small-caps header row
- **Theorem-style callouts** — 13+ built-in types plus custom `[!theorem]` / `[!lemma]` / `[!proposition]` / `[!corollary]` / `[!proof]` / `[!definition]` / `[!remark]` / `[!example]`; `[!proof]` auto-appends ∎
- **Mermaid in warm palette** — flowchart / sequence / state / class / gantt / pie / ER diagrams all recolored
- **Light & dark, both warm** — near-black `#141413` dark variant keeps the same warm-tone discipline
- **Ring shadows over drop shadows** — depth via inset / 1px rings in warm grays, à la Claude
- **Content typography** — small-caps at H5 / H6, italic at H4, tight display letter-spacing on the inline title, old-style figures in body text with tabular lining figures in tables

---

## Per-note modes

Nous supports optional "jackets" via the `cssclasses` frontmatter. Stack them.

```yaml
---
cssclasses:
  - paper        # LaTeX article mode
  - handwriting  # quill-and-parchment mode
---
```

### Paper mode

- Section-numbered headings (`§ 1.1.1`) with the `§` mark in terracotta
- Drop cap on the first paragraph
- Justified body with automatic hyphenation
- Figure N / Table N italic captions (from `![](img)` followed by `*caption*`)
- `<hr>` becomes a single `§` ornament
- H1 centered, with the section number on the same line
- Tighter column width than the global reading width

### Handwriting mode

- English body in Petit Formal Script / Parisienne
- Chinese body in Xingkai SC 行楷 / Kaiti SC 楷体 (thin, calligraphic)
- H1 / H2 / H3 get flower ornaments (❃ ✿ ❁) in terracotta
- Code blocks, tables, math blocks **revert to monospace / serif** so they stay legible
- Paragraphs get first-line indent like a hand-copied page
- Blockquotes become centered pull-quotes with a raised open-quote glyph
- Edit mode uses normal body size so typing isn't encumbered; preview goes full calligraphy

Compose `paper` + `handwriting` → a hand-scribed academic article (drop cap in Parisienne, justified script body, numbered sections).

---

## Optional snippets

Drop the contents of `snippets/` (also in the `snippets.zip` release asset) into `YourVault/.obsidian/snippets/` and enable each in **Settings → Appearance → CSS snippets**.

| Snippet | What it does |
| --- | --- |
| `nous-paper-mode.css` | The full paper-mode rule set (trigger: `cssclasses: [paper]`) |
| `nous-handwriting.css` | The full handwriting-mode rule set (trigger: `cssclasses: [handwriting]`) |
| `nous-theorem-counters.css` | Auto-number `theorem` / `lemma` / `proposition` / `corollary` callouts amsthm-style |
| `nous-classical-figures.css` | OpenType old-style figures in body; tabular lining figures in tables |

---

## Style Settings integration

If you have the **Style Settings** community plugin installed, Nous exposes controls for:

- Serif heading / body font
- Sans UI font
- Monospace font
- Body text size
- Body line height
- Reading column width
- Toggle: justified body
- Toggle: numbered headings (`§ 1.1.1` in standard reading view, no `paper` class needed)
- Toggle: drop-cap first paragraph
- Toggle: disable small-caps H5 / H6

---

## Font stack and credits

Nous loads via Google Fonts. If you're offline or prefer different faces, set your own via Style Settings.

- [Crimson Pro](https://fonts.google.com/specimen/Crimson+Pro) — Sebastian Kosch (body + headline serif)
- [EB Garamond](https://fonts.google.com/specimen/EB+Garamond) — Georg Duffner (fallback serif)
- [Inter](https://fonts.google.com/specimen/Inter) — Rasmus Andersson (UI sans)
- [JetBrains Mono](https://fonts.google.com/specimen/JetBrains+Mono) — JetBrains (code)
- [Petit Formal Script](https://fonts.google.com/specimen/Petit+Formal+Script) — Brownfox (handwriting body)
- [Parisienne](https://fonts.google.com/specimen/Parisienne) — Astigmatic (handwriting headline)
- [Long Cang](https://fonts.google.com/specimen/Long+Cang) — Chinese calligraphic fallback
- **Songti SC** / **Kaiti SC** / **Xingkai SC** / **Hanzipen SC** — macOS system (Chinese)

---

## Alpha note

`1.0.0-alpha.1` is the first public release. It's already usable as a daily-driver theme, but expect:

- Variable renames before 1.0
- More `cssclasses` modes
- Fuller coverage of third-party plugin UIs (Dataview, Kanban, Advanced Tables, etc.)

File issues with screenshots and the offending element's selector (Cmd+Option+I → Inspect) if you hit something.

---

## Design reference

The full visual spec lives at [`docs/DESIGN.md`](docs/DESIGN.md) — palette, type hierarchy, spacing, component principles. The spec was derived from Claude's web design and annotated for Obsidian porting.

---

## License

[MIT](LICENSE) © 2026 [lgl](https://github.com/islgl)
