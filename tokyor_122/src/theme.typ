#import "@preview/touying:0.7.4": *
#import themes.stargazer: stargazer-theme

#let paper = rgb("#141820")
#let panel = rgb("#202733")
#let ink = rgb("#f5f6f2")
#let muted = rgb("#aeb9c6")
#let accent = rgb("#78d8d0")
#let warm = rgb("#ffd17b")
#let line-color = rgb("#40505e")

#let quiet-header(self) = {
  if self.store.title != none {
    block(width: 100%, height: 2.65em)[
      #place(top + left, dy: 0.40em, text(size: 1.18em, weight: "bold", fill: ink, self.store.title))
      #place(bottom + left, line(length: 100%, stroke: 0.8pt + line-color))
    ]
  }
}

#let quiet-footer(self) = none

#let deck-theme = stargazer-theme.with(
  aspect-ratio: "16-9",
  align: top + left,
  progress-bar: false,
  footer-columns: (1fr,),
  config-colors(
    primary: accent,
    primary-dark: accent,
    secondary: paper,
    tertiary: warm,
    neutral-lightest: ink,
    neutral-darkest: paper,
  ),
  config-common(
    breakable: false,
    detect-overflow: true,
    nontight-list-enum-and-terms: true,
  ),
  config-page(
    fill: paper,
    margin: (top: 3.05em, bottom: 0.95em, x: 2.2em),
  ),
  config-store(
    navigation: none,
    header: quiet-header,
    footer: quiet-footer,
  ),
)
