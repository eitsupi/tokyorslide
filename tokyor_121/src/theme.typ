#import "@preview/touying:0.7.4": *
#import themes.stargazer: stargazer-theme

#let ink = rgb("#17212b")
#let muted = rgb("#66727f")
#let accent = rgb("#0b7891")
#let accent-dark = rgb("#07536a")
#let warm = rgb("#e46f47")
#let paper = rgb("#ffffff")
#let wash = rgb("#f1f5f7")
#let line-color = rgb("#dbe3e8")

#let quiet-header(self) = {
  if self.store.title != none {
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.65em,
      align: horizon,
      rect(width: 5pt, height: 1.2em, radius: 3pt, fill: accent),
      text(size: 1.12em, weight: "bold", fill: ink, self.store.title),
    )
    v(0.35em)
    line(length: 100%, stroke: 0.8pt + line-color)
  }
}

#let quiet-footer(self) = {
  set text(size: 9pt, fill: muted)
  grid(
    columns: (1fr, auto),
    align: (left + horizon, right + horizon),
    [Tokyo.R #121],
    context utils.slide-counter.display(),
  )
}

#let deck-theme = stargazer-theme.with(
  aspect-ratio: "16-9",
  align: top + left,
  progress-bar: true,
  footer-columns: (1fr,),
  config-colors(
    primary: accent,
    primary-dark: accent-dark,
    secondary: paper,
    tertiary: warm,
    neutral-lightest: paper,
    neutral-darkest: ink,
  ),
  config-common(
    breakable: false,
    detect-overflow: true,
    nontight-list-enum-and-terms: true,
  ),
  config-page(
    fill: paper,
    margin: (top: 3.35em, bottom: 1.7em, x: 2.25em),
  ),
  config-store(
    navigation: none,
    header: quiet-header,
    footer: quiet-footer,
  ),
)
