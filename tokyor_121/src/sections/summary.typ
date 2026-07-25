#import "../theme.typ": *
#import "../components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([04], [まとめ], subtitle: [Rを使う自分が欲しかったものを、形にした])

#slide(title: [3つの道具、3つの不便])[
  #grid(
    columns: (auto, 1fr), row-gutter: 0.8em, column-gutter: 0.8em, align: horizon,
    pill([arf]),
    takeaway([1], [R console], [インストール・切替・検索・外部操作をひとつに]),
    pill([rd2qmd], fill: rgb("#fff0eb"), color: warm),
    takeaway([2], [Documentation], [Rdを正確で再利用しやすいMarkdownへ]),
    pill([jgd], fill: rgb("#efeff8"), color: rgb("#5b67a5")),
    takeaway([3], [Graphics], [軽いR deviceから自由なRendererへ]),
  )
]

#slide(title: none, header: none, footer: none, align: center + horizon)[
  #text(size: 1.8em, weight: "bold", fill: ink, [ニッチだけど、欲しかった。])
  #v(0.7em)
  #text(size: 0.9em, fill: muted, [興味があれば、ぜひ使ってみてください。])
  #v(1.1em)
  #grid(
    columns: (auto, auto, auto), column-gutter: 0.55em,
    pill([github.com/eitsupi/arf]),
    pill([github.com/eitsupi/rd2qmd], fill: rgb("#fff0eb"), color: warm),
    pill([github.com/grantmcdermott/jgd], fill: rgb("#efeff8"), color: rgb("#5b67a5")),
  )
  #v(1.0em)
  #text(size: 0.72em, weight: "bold", fill: accent, [ありがとうございました])
]
