#import "../theme.typ": *
#import "../components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([02], [rd2qmd], subtitle: [RdファイルをMarkdown・Quartoに変換])

#slide(title: [着想], align: left + horizon)[
  #feature-list(
    [r-polarsのウェブサイトで使っているaltdocのRdからmdへの変換が \ 不正確なため、表示を直したかった],
    [Rdを正確にMarkdownへ変換する決定的な実装は見つからず],
    [Rustはこの手の処理に向いているっぽいので、試しに作ってみた],
  )
]

#section-title([], [機能紹介], subtitle: [rd2qmd])

#slide(title: [変換前 / 変換後])[
  #before-after(
    before-title: [Rd],
    after-title: [Quarto Markdown],
    [
      #code-panel[
```rd
\name{simple}
\title{A Simple Function}
\usage{simple(x, y = 1)}
\arguments{
  \item{x}{The first argument.}
  \item{y}{Defaults to 1.}
}
\examples{simple(1, 2)}
```
      ]
    ],
    [
      #code-panel[
````md
# A Simple Function

## Usage
```r
simple(x, y = 1)
```

## Arguments
| Argument | Description |
|---|---|
| `x` | The first argument. |
| `y` | Defaults to 1. |
````
      ]
    ],
  )
]

#slide(title: [使い方])[
  #two-columns(
    [
      #code-panel[
```sh
rd2qmd convert man/ -o docs/

# Markdownを出力
rd2qmd convert file.Rd -f md

# 並列処理
rd2qmd convert man/ -o docs/ -j4
```
      ]
    ],
    [
      #feature-list(
        [単体のRdファイルまたはパッケージ全体を変換],
        [パッケージ内・外のリンクを解決],
        [topic indexをJSONで生成],
        [Rのインストールは不要],
      )
    ],
    ratio: (1.05fr, 0.95fr),
    align: horizon,
  )
]

#slide(title: [arfへの組み込み], align: left + horizon)[
  #grid(
    columns: (1fr, auto, 1fr),
    column-gutter: 1.1em,
    align: horizon,
    [
      #text(size: 1.05em, weight: "bold", [rd2qmd])
      #v(0.35em)
      #text(size: 0.68em, fill: muted, [RdをMarkdownへ変換])
    ],
    [#text(size: 1.4em, fill: accent, [→])],
    [
      #text(size: 1.05em, weight: "bold", [arf Help Browser])
      #v(0.35em)
      #text(size: 0.68em, fill: muted, [パッケージのヘルプを端末に表示])
    ],
  )
  #v(1.0em)
  #text(size: 0.72em, [rd2qmdの変換処理を使って、arfにHelp Browserを実装できました。])
]
