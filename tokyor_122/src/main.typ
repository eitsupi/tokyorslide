#set text(
  lang: "ja",
  size: 20pt,
  fill: rgb("#f5f6f2"),
  font: "Noto Sans CJK JP",
)
#set par(leading: 0.90em)

#import "@preview/touying:0.7.4": *
#import "theme.typ": deck-theme
#import "components.typ": *

#show: deck-theme.with(
  config-info(
    title: [ADBC最前線？],
    short-title: [ADBC最前線？],
    subtitle: [Arrowとデータベース接続の話],
    author: [\@eitsupi],
    date: [Tokyo.R #122 · 2026-10-03],
  ),
)

#set text(size: 20pt)

#include "sections/intro.typ"
#include "sections/core.typ"
#include "sections/ecosystem.typ"
#include "sections/r.typ"
#include "sections/closing.typ"
