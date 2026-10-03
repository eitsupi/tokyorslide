#import "@preview/touying:0.7.4": *
#import "theme.typ": ink, accent

#let section-title(index, title) = slide(
  title: none,
  header: none,
  footer: none,
  align: left + horizon,
)[
  #text(size: 2.20em, weight: "bold", fill: ink, title)
]

#let two-columns(left, right, ratio: (1fr, 1fr), gutter: 1.0em, align: top) = grid(
  columns: ratio,
  column-gutter: gutter,
  align: align,
  left,
  right,
)

#let feature-list(..items) = {
  set list(marker: [#text(fill: accent, [•])], indent: 1.1em, body-indent: 0.55em)
  set text(size: 0.88em)
  list(..items.pos().map(item => [#item]))
}
