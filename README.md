<h1 align="center">Nous — An Obsidian theme</h1>

<p align="center">
  <em>Warm parchment, serif headlines, theorem-style callouts —<br>
  a scholar's notebook for Obsidian.</em>
</p>

<p align="center">
  <a href="https://github.com/islgl/nous-obsidian-theme/releases"><img src="https://img.shields.io/github/v/release/islgl/nous-obsidian-theme?display_name=tag&label=release&color=c96442" alt="Latest release"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/islgl/nous-obsidian-theme?color=a67b5b&labelColor=3d2f22" alt="License"></a>
  <img src="https://img.shields.io/badge/Obsidian-v1.4.0%2B-6b5844?labelColor=141413" alt="Obsidian 1.4.0+">
  <img src="https://img.shields.io/badge/modes-light%20%7C%20dark-d97757?labelColor=8d5a3c" alt="Light and dark modes">
</p>

Nous (νοῦς, *mind / intellect*) turns an Obsidian vault into a scholar's notebook: a parchment-toned canvas, a medium-weight serif headline voice, booktabs tables, and theorem-like callouts — all drawing from the same warm editorial palette.

---

## Preview

<table>
  <tr>
    <td align="center" width="50%">
      <img src="assets/screenshots/hero.png" alt="Base theme, light"><br>
      <sub><em>Base theme — reading view, light.</em></sub>
    </td>
    <td align="center" width="50%">
      <img src="assets/screenshots/dark.png" alt="Dark mode"><br>
      <sub><em>Dark mode — same warm discipline, near-black surface.</em></sub>
    </td>
  </tr>
  <tr>
    <td align="center" width="50%">
      <img src="assets/screenshots/callouts.png" alt="Callout gallery"><br>
      <sub><em>Built-in callouts — warm palette, serif labels.</em></sub>
    </td>
    <td align="center" width="50%">
      <img src="assets/screenshots/tables.png" alt="Booktabs tables and math"><br>
      <sub><em>Booktabs tables and display math — LaTeX-style rules.</em></sub>
    </td>
  </tr>
</table>

---

## Install

### Community store (recommended)

1. Obsidian → **Settings → Appearance → Themes → Manage** → search **Nous** → **Install** → **Use**.
2. You'll get automatic updates whenever a new version is released.

> If you don't see Nous yet, the community PR may still be in review — use the manual path below in the meantime.

### Manual

1. Download `theme.css` and `manifest.json` from the [latest release](https://github.com/islgl/nous-obsidian-theme/releases).
2. Put them in `YourVault/.obsidian/themes/Nous/`.
3. Obsidian → **Settings → Appearance → Themes → Nous**.

---

## Features

- **Warm palette** — parchment `#fdfcf9` canvas, terracotta `#a8553a` accent, every gray carries a yellow-brown undertone, no cool blue-grays anywhere
- **Serif body in edit *and* reading view** — EB Garamond / Crimson Pro / Songti SC, so you write on paper, not in a chat box
- **LaTeX booktabs tables** — top & bottom 2px rules, 1px mid rule, no verticals, small-caps header row
- **Theorem-style callouts** — 13+ built-in types plus custom `[!theorem]` / `[!lemma]` / `[!proposition]` / `[!corollary]` / `[!proof]` / `[!definition]` / `[!remark]` / `[!example]`; `[!proof]` auto-appends ∎
- **Mermaid in warm palette** — flowchart / sequence / state / class / gantt / pie / ER diagrams all recolored
- **Light & dark, both warm** — near-black `#15140f` dark variant keeps the same warm-tone discipline
- **Ring shadows over drop shadows** — depth via inset / 1px rings in warm grays
- **Content typography** — small-caps at H5 / H6, italic at H4, tight display letter-spacing on the inline title, old-style figures in body text with tabular lining figures in tables

---

## Optional snippets

Drop the contents of `snippets/` (also in the `snippets.zip` release asset) into `YourVault/.obsidian/snippets/` and enable each in **Settings → Appearance → CSS snippets**.

| Snippet | What it does |
| --- | --- |
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
- Toggle: numbered headings (`§ 1.1.1`)
- Toggle: drop-cap first paragraph
- Toggle: disable small-caps H5 / H6

---

## Font stack and credits

Nous loads via Google Fonts. If you're offline or prefer different faces, set your own via Style Settings.

- [EB Garamond](https://fonts.google.com/specimen/EB+Garamond) — Georg Duffner (body + headline serif)
- [Crimson Pro](https://fonts.google.com/specimen/Crimson+Pro) — Sebastian Kosch (alternate serif)
- [Cormorant Garamond](https://fonts.google.com/specimen/Cormorant+Garamond) — Christian Thalmann (display headings)
- [Inter](https://fonts.google.com/specimen/Inter) — Rasmus Andersson (UI sans)
- [JetBrains Mono](https://fonts.google.com/specimen/JetBrains+Mono) — JetBrains (code)
- **Songti SC** / **Kaiti SC** — macOS system (Chinese)

---

## Roadmap

`1.0.0` is the first stable release — daily-driver-ready, palette locked, variable names stable. Post-1.0 work will focus on:

- Fuller coverage of third-party plugin UIs (Kanban, Advanced Tables, Excalidraw, Canvas)
- Accessibility audits and high-contrast variants

File issues with screenshots and the offending element's selector (Cmd+Option+I → Inspect) if you hit something.

---

## Acknowledgments

- **The LaTeX / booktabs tradition** — the rule system, theorem environments, and §-numbered section conventions are lifted from decades of academic typesetting practice.
- **Obsidian community** — for the Style Settings plugin that makes user-facing controls possible.

---

## License

[MIT](LICENSE) © 2026 [shufflgl](https://github.com/islgl)
