#set text(
  lang: "ja",
  size: 20pt,
  fill: rgb("#f5f6f2"),
  font: "Noto Sans CJK JP",
)
#set par(leading: 0.72em)

#import "@preview/touying:0.7.4": *
#import "theme.typ": deck-theme
#import "components.typ": *

#show: deck-theme.with(
  config-info(
    title: [ADBC: Arrow時代のデータベース接続],
    short-title: [ADBC],
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
