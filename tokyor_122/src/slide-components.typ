#import "theme.typ": ink, muted, accent, warm, paper, panel, line-color

#let source(label, url) = link(url, text(fill: accent, label))

#let sources(body) = {
  v(0.38em)
  line(length: 100%, stroke: 0.5pt + line-color)
  v(0.16em)
  text(size: 11.5pt, fill: muted, body)
}

#let note(body) = block(
  width: 100%,
  inset: (left: 0.6em, y: 0.17em),
  stroke: (left: 3pt + warm),
  text(size: 0.88em, body),
)

#let cell(body, sub: none, color: ink) = block(
  width: 100%,
  fill: panel,
  inset: (x: 0.55em, y: 0.40em),
  align(center, [
    #text(size: 0.88em, weight: "bold", fill: color, body)
    #if sub != none {
      v(0.10em)
      text(size: 0.72em, fill: muted, sub)
    }
  ]),
)

#let arrow() = text(size: 0.95em, fill: accent, [→])
#let down() = align(center, text(size: 0.85em, fill: accent, [↓]))

#let label(name, value) = grid(
  columns: (0.30fr, 0.70fr),
  column-gutter: 0.4em,
  align: horizon,
  text(weight: "bold", fill: accent, name),
  value,
)

#let code-panel(body) = block(
  width: 100%,
  fill: rgb("#edf2f6"),
  inset: (x: 0.7em, y: 0.55em),
  text(size: 0.69em, fill: rgb("#172331"), body),
)
