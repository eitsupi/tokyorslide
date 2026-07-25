#import "../theme.typ": *
#import "../components.typ": *
#import "@preview/touying:0.7.4": *

#slide(title: none, header: none, footer: none, align: left + horizon)[
  #grid(
    columns: (1fr, 0.25fr), column-gutter: 1.4em, align: horizon,
    [
      #title-lockup(
        [ここ半年くらいで\ AIに作らせたR用ツール],
        kicker: [TOKYO.R #121],
        subtitle: [不便だったところを、使いたい道具に変える],
      )
      #v(1.15em)
      #pill([arf · rd2qmd · jgd])
    ],
    [
      #align(right, [
        #text(size: 4.7em, weight: "bold", fill: rgb("#e7eef1"), [R])
        #v(-0.5em)
        #text(size: 0.82em, weight: "bold", fill: ink, [\@eitsupi])
        #v(0.2em)
        #text(size: 0.58em, fill: muted, [2026.07.25])
      ])
    ],
  )
]

#slide(title: [自己紹介])[
  #two-columns(
    [
      #text(size: 1.55em, weight: "bold", fill: ink, [\@eitsupi])
      #v(0.55em)
      #text(size: 0.78em, fill: muted, [Rと、その周辺の開発をしています])
      #v(1.05em)
      #quote(
        [「毎日使うところ」の小さな不便が気になる],
        attribution: [今回の3つも、すべて自分の利用場面から],
      )
    ],
    [
      #grid(
        columns: (1fr, 1fr), rows: (1fr, 1fr), gutter: 0.65em,
        feature-card([R], body: [日々のデータ分析]),
        feature-card([Rust], body: [配布しやすいCLI]),
        feature-card([r-polars], body: [2025年の中心]),
        feature-card([Tooling], body: [REPL・docs・graphics]),
      )
    ],
    ratio: (1.05fr, 0.95fr),
  )
]

#slide(title: [去年との違い])[
  #grid(
    columns: (1fr, auto, 1fr), column-gutter: 1.25em, align: horizon,
    [
      #pill([2025], fill: rgb("#eef1f3"), color: muted)
      #v(0.55em)
      #text(size: 1.5em, weight: "bold", fill: ink, [r-polars])
      #v(0.4em)
      #text(size: 0.72em, fill: muted, [ひとつの大きなプロジェクトに集中])
    ],
    [#text(size: 1.6em, weight: "bold", fill: accent, [→])],
    [
      #pill([2026], fill: rgb("#e8f5f7"), color: accent-dark)
      #v(0.55em)
      #text(size: 1.5em, weight: "bold", fill: accent-dark, [道具を次々つくる])
      #v(0.4em)
      #text(size: 0.72em, fill: muted, [これまで手を出せなかった領域へ])
    ],
  )
  #v(1.15em)
  #quote([AIは主役ではなく、着手できる範囲を広げた道具])
]

#slide(title: [最近つくった3つ])[
  #grid(
    columns: (1fr, 1fr, 1fr), column-gutter: 0.75em,
    tool-card([arf], [R console], [radianを置き換える\ 毎日使えるフロントエンド], color: accent),
    tool-card([rd2qmd], [Documentation], [Rdを読みやすい\ Markdown / Quartoへ], color: warm),
    tool-card([jgd], [Graphics device], [描画命令をJSONで\ 好きなRendererへ], color: rgb("#5b67a5")),
  )
  #v(0.95em)
  #align(center, text(size: 0.86em, weight: "bold", fill: ink, [出発点は、Rを使っていて困ったこと]))
]

#slide(title: [別々の道具が、つながってきた])[
  #grid(
    columns: (1fr, auto, 1fr, auto, 1fr), column-gutter: 0.45em, align: horizon,
    feature-card([rd2qmd], body: [Rd → Markdown]),
    text(size: 1.0em, weight: "bold", fill: accent, [→]),
    feature-card([arf Help], body: [内蔵ヘルプ表示]),
    text(size: 1.0em, weight: "bold", fill: accent, [→]),
    feature-card([jgd tests], body: [headless + IPC]),
  )
  #v(1.0em)
  #two-columns(
    takeaway([1], [変換処理を再利用], [rd2qmdの成果がarfのHelp Browserへ]),
    takeaway([2], [操作を自動化], [arfのIPCがjgdのE2Eテストへ]),
  )
]
