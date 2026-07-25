#set text(
  lang: "ja",
  size: 20pt,
  fill: rgb("#17212b"),
)
#set par(leading: 0.72em)

#import "@preview/touying:0.7.4": *
#import "theme.typ": deck-theme
#import "components.typ": *

#show: deck-theme.with(
  config-info(
    title: [ここ半年くらいでAIに作らせたR用ツール],
    short-title: [AIに作らせたR用ツール],
    subtitle: [arf · rd2qmd · jgd],
    author: [\@eitsupi],
    date: [Tokyo.R #121],
  ),
)

#set text(size: 24pt)

#include "sections/intro.typ"
#include "sections/arf.typ"
#include "sections/rd2qmd.typ"
#include "sections/jgd.typ"
#include "sections/summary.typ"
