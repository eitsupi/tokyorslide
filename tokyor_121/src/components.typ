#import "@preview/touying:0.7.4": *
#import "theme.typ": ink, muted, accent, accent-dark, warm, paper, wash, line-color

#let title-lockup(kicker: none, title, subtitle: none) = {
  if kicker != none {
    text(size: 0.62em, weight: "bold", fill: accent, tracking: 0.08em, kicker)
    v(0.7em)
  }
  text(size: 2.05em, weight: "bold", fill: ink, title)
  if subtitle != none {
    v(0.75em)
    text(size: 0.88em, fill: muted, subtitle)
  }
}

#let pill(body, fill: wash, color: accent-dark) = box(
  fill: fill,
  radius: 99pt,
  inset: (x: 0.72em, y: 0.28em),
  text(size: 0.62em, weight: "bold", fill: color, body),
)

#let section-title(index, title, subtitle: none) = slide(
  title: none,
  header: none,
  footer: none,
  align: left + horizon,
)[
  #text(size: 2.5em, weight: "bold", fill: ink, title)
  #if subtitle != none {
    v(0.7em)
    text(size: 0.85em, fill: muted, subtitle)
  }
]

#let two-columns(left, right, ratio: (1fr, 1fr), gutter: 1.25em, align: top) = grid(
  columns: ratio,
  column-gutter: gutter,
  align: align,
  left,
  right,
)

#let feature-card(title, body: none, icon: none, accent-color: accent) = block(
  width: 100%,
  fill: wash,
  radius: 10pt,
  inset: 0.8em,
  stroke: 0.7pt + line-color,
  [
    #if icon != none {
      text(size: 1.15em, fill: accent-color, icon)
      h(0.35em)
    }
    #text(size: 0.78em, weight: "bold", fill: ink, title)
    #if body != none {
      v(0.35em)
      text(size: 0.62em, fill: muted, body)
    }
  ],
)

#let feature-list(..items) = {
  set list(marker: [#circle(radius: 3pt, fill: accent)], indent: 1.1em, body-indent: 0.55em)
  set text(size: 0.78em)
  list(..items.pos().map(item => [#item]))
}

#let framed-image(source, height: auto, fit: "contain", radius: 5pt) = {
  let visual = if height == auto {
    image(source, width: 100%)
  } else {
    image(source, width: 100%, height: height, fit: fit)
  }
  block(
    width: 100%,
    radius: radius,
    clip: true,
    stroke: 0.8pt + line-color,
    visual,
  )
}

#let hero-image(source, caption: none, height: 5.25em) = {
  framed-image(source, height: height, fit: "contain")
  if caption != none {
    v(0.4em)
    align(center, text(size: 0.58em, fill: muted, caption))
  }
}

#let full-image(source, height: auto, fit: "contain") = framed-image(source, height: height, fit: fit)

#let image-with-note(source, note, side: "right", ratio: (1.55fr, 0.75fr)) = {
  let visual = framed-image(source)
  let copy = align(horizon, note)
  if side == "right" {
    two-columns(visual, copy, ratio: ratio)
  } else {
    two-columns(copy, visual, ratio: ratio.rev())
  }
}

#let before-after(before-title: [Before], after-title: [After], before, after) = grid(
  columns: (1fr, auto, 1fr),
  column-gutter: 0.7em,
  align: horizon,
  block(width: 100%, [#pill(before-title, fill: rgb("#fff0eb"), color: warm) #v(0.45em) #before]),
  text(size: 1.35em, weight: "bold", fill: accent, [→]),
  block(width: 100%, [#pill(after-title, fill: rgb("#e8f5f7"), color: accent-dark) #v(0.45em) #after]),
)

#let code-panel(body, fill: rgb("#17212b"), color: rgb("#eef3f5")) = block(
  width: 100%, fill: fill, radius: 8pt, inset: 0.72em,
  stroke: 0.8pt + line-color,
  text(size: 0.57em, fill: color, body),
)

#let quote(body, attribution: none) = block(
  width: 100%, inset: (left: 1em, y: 0.45em), stroke: (left: 5pt + accent),
  [
    #text(size: 1.02em, weight: "medium", fill: ink, body)
    #if attribution != none {
      v(0.45em)
      text(size: 0.62em, fill: muted, attribution)
    }
  ],
)

#let metric(value, label, color: accent) = align(center, [
  #text(size: 1.45em, weight: "bold", fill: color, value)
  #v(0.15em)
  #text(size: 0.58em, fill: muted, label)
])

#let tool-card(name, role, detail, color: accent) = block(
  width: 100%, height: 4.25em, radius: 11pt, inset: 0.75em,
  fill: paper, stroke: 1.2pt + color,
  [
    #text(size: 1.02em, weight: "bold", fill: color, name)
    #v(0.25em)
    #text(size: 0.67em, weight: "bold", fill: ink, role)
    #v(0.3em)
    #text(size: 0.55em, fill: muted, detail)
  ],
)

#let flow-node(title, subtitle: none, color: accent) = block(
  width: 100%, fill: paper, radius: 8pt, inset: (x: 0.55em, y: 0.45em),
  stroke: 1.2pt + color,
  align(center, [
    #text(size: 0.7em, weight: "bold", fill: ink, title)
    #if subtitle != none {
      v(0.15em)
      text(size: 0.48em, fill: muted, subtitle)
    }
  ]),
)

#let architecture-flow(..nodes) = {
  let parts = ()
  let values = nodes.pos()
  for (i, node) in values.enumerate() {
    parts.push(node)
    if i < values.len() - 1 {
      parts.push(align(center, text(size: 1.0em, weight: "bold", fill: accent, [↓])))
    }
  }
  stack(dir: ttb, spacing: 0.25em, ..parts)
}

#let takeaway(number, title, body) = grid(
  columns: (auto, 1fr), column-gutter: 0.7em, align: top,
  box(
    width: 1.65em, height: 1.65em, radius: 99pt, fill: accent,
    align(center + horizon, text(size: 0.67em, weight: "bold", fill: paper, number)),
  ),
  [
    #text(size: 0.8em, weight: "bold", fill: ink, title)
    #v(0.2em)
    #text(size: 0.6em, fill: muted, body)
  ],
)

#let centered-body(body) = block(
  width: 100%,
  height: 17em,
  align(left + horizon, body),
)
