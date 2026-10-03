#import "../theme.typ": *
#import "../components.typ": *
#import "../slide-components.typ": *
#import "@preview/touying:0.7.4": *

#slide(title: none, header: none, footer: none, align: left + horizon)[
  #text(size: 0.88em, fill: accent, [Tokyo.R #122 · 2026-10-03])
  #v(0.65em)
  #text(size: 2.6em, weight: "bold", fill: ink, [ADBC最前線？])
  #v(0.15em)
  #text(size: 1.28em, fill: ink, [Apache Arrow時代のデータベース接続])
  #v(0.92em)
  #text(size: 0.88em, fill: muted, [\@eitsupi])
]

// 自己紹介の内容は第121回からコピー。発表者が更新するためのページ。
#slide(title: [自己紹介])[
  #two-columns(
    [#align(center, image("/image/eitsupi.jpg", width: 82%))],
    [
      #text(size: 1.05em, weight: "bold", [\@eitsupi])
      #v(0.35em)
      #feature-list(
        [本業：手料理サブスク Tsuklio のデータ周り],
        [
          副業：Columnar社でApache Arrow ADBC周りの開発
          #v(0.2em)
          #list(
            marker: [-],
            indent: 1em,
            body-indent: 0.45em,
            [本資料は個人の見解であり所属組織とは関係ありません（※言ってみたかった）],
          )
        ],
        [Excelが嫌になりRを使い始めて7年],
        [
          近況
          #v(0.2em)
          #list(
            marker: [-],
            indent: 1em,
            body-indent: 0.45em,
            [arf等のR関連ツール開発],
            [Rコンソーシアムの助成金応募してみた],
            [停滞していたvscode-Rの3.0.0リリース関与],
          )
        ],
      )
    ],
    ratio: (0.30fr, 0.70fr),
    align: horizon,
  )
]
