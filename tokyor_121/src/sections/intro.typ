#import "../theme.typ": *
#import "../components.typ": *
#import "@preview/touying:0.7.4": *

#slide(title: none, header: none, footer: none, align: left + horizon)[
  #text(size: 2.15em, weight: "bold", fill: ink, [ここ半年くらいで\ AIに作らせたR用ツール])
  #v(1.0em)
  #text(size: 0.82em, fill: muted, [arf console, rd2qmd, jgd, ...])
  #v(1.2em)
  #text(size: 0.72em, [\@eitsupi])
  #v(0.2em)
  #text(size: 0.62em, fill: muted, [Tokyo.R #121 — 2026-07-25])
]

#slide(title: [自己紹介])[
  #two-columns(
    [
      #align(center, image("/image/eitsupi.jpg", width: 82%))
    ],
    [
      #text(size: 1.05em, weight: "bold", [\@eitsupi])
      #v(0.35em)
      #feature-list(
        [本業：手料理サブスク Tsuklio のデータ周り],
        [副業：Columnar社でApache Arrow ADBC周りの開発],
        [Excelが嫌になりRを使い始めて7年],
        [Rockerプロジェクト（Shell、R、Docker）],
        [Polars Rパッケージ（R、Rust）],
        [最近はarfの人、後述],
      )
    ],
    ratio: (0.30fr, 0.70fr),
    align: horizon,
  )
]

#slide(title: [最近やってたこと], align: left + horizon)[
  #align(horizon, [
    #grid(
      columns: (0.18fr, 0.82fr),
      row-gutter: 1.3em,
      column-gutter: 0.9em,
      align: horizon,
      text(size: 1.1em, weight: "bold", fill: muted, [2025]),
      [
        #text(size: 1.1em, weight: "bold", [r-polarsの開発])
        #v(0.2em)
        #text(size: 0.66em, fill: muted, [Japan.R 2025で発表])
      ],
      text(size: 1.1em, weight: "bold", fill: accent, [2026]),
      [
        #text(size: 1.1em, weight: "bold", [エージェンティックコーディングに移行])
        #v(0.2em)
        #text(size: 0.66em, fill: muted, [これまで手を出せなかったツール群を作成])
        #v(0em)
        #text(size: 0.66em, fill: muted, [このスライドもCodex CLIにTypstで作らせた])
      ],
    )
  ])
]

#slide(title: [最近作ったツール], align: left + horizon)[
  #align(horizon, [
    #grid(
      columns: (0.23fr, 0.77fr),
      row-gutter: 1.25em,
      column-gutter: 0.8em,
      align: horizon,
      text(size: 1.3em, weight: "bold", fill: accent, [arf]),
      [#text(size: 0.9em, weight: "bold", [R端末]) #v(0.15em) #text(size: 0.62em, fill: muted, [radianの置き換え（Rust）])],
      text(size: 1.3em, weight: "bold", fill: warm, [rd2qmd]),
      [#text(size: 0.9em, weight: "bold", [Rd → Markdown変換]) #v(0.15em) #text(size: 0.62em, fill: muted, [pkgdownの置き換え（Rust）])],
      text(size: 1.3em, weight: "bold", fill: rgb("#5b67a5"), [jgd]),
      [#text(size: 0.9em, weight: "bold", [Rグラフィックデバイス]) #v(0.15em) #text(size: 0.62em, fill: muted, [httpgdの置き換え（C、TypeScript、Go、Rust）])],
    )
  ])
]

#slide(title: [ツール間のつながり], align: left + horizon)[
  #align(horizon, [
    #text(size: 0.78em, [arf、rd2qmd、jgdはそれぞれ無関係に始めたが、意外とそれぞれが関連して活きた])
    #v(1.0em)
    #grid(
      columns: (0.28fr, auto, 0.58fr),
      row-gutter: 1.25em,
      column-gutter: 0.7em,
      align: horizon,
      text(size: 0.9em, weight: "bold", [rd2qmd]),
      text(size: 1.0em, fill: accent, [→]),
      text(size: 0.72em, [arfの内蔵Help Browser]),
      text(size: 0.9em, weight: "bold", [arfのIPC・Headless]),
      text(size: 1.0em, fill: accent, [→]),
      text(size: 0.72em, [jgdのAIエージェントによるバグ潰し・E2Eテスト]),
    )
  ])
]
