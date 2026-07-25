#import "../theme.typ": *
#import "../components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([02], [rd2qmd], subtitle: [Rdを、サイトで使えるMarkdownへ])

#slide(title: [Rd → Markdown を、ちゃんと変換したい])[
  #two-columns(
    [
      #text(size: 1.12em, weight: "bold", fill: ink, [困っていたこと])
      #v(0.65em)
      #feature-list(
        [r-polarsのサイト生成で変換結果が崩れる],
        [リンク解決や引数表の扱いが不正確],
        [決定的に使える実装が見つからない],
      )
    ],
    [
      #quote([Rを起動せず、パッケージ単位で速く正確に変換する])
      #v(0.8em)
      #grid(
        columns: (1fr, 1fr), gutter: 0.55em,
        metric([Rust], [single binary], color: warm),
        metric([qmd], [Quarto ready], color: warm),
      )
    ],
    ratio: (1.1fr, 0.9fr),
  )
]

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

#slide(title: [パッケージ単位で変換する])[
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
      #takeaway([1], [リンクを解決], [同一パッケージ内と外部パッケージを区別])
      #v(0.75em)
      #takeaway([2], [索引も生成], [topic・alias・lifecycleをJSONへ])
      #v(0.75em)
      #takeaway([3], [Rは不要], [CLI単体で変換パイプラインに組み込める])
    ],
    ratio: (1.05fr, 0.95fr),
  )
]

#slide(title: [変換器が、Help Browserになった])[
  #grid(
    columns: (1fr, auto, 1fr),
    column-gutter: 1.25em,
    align: horizon,
    [
      #text(size: 1.05em, weight: "bold", fill: ink, [rd2qmd])
      #v(0.35em)
      #text(size: 0.65em, fill: muted, [Rdを構造化して\ Markdownへ変換])
    ],
    [#text(size: 2.0em, weight: "bold", fill: accent, [→])],
    [
      #text(size: 1.05em, weight: "bold", fill: ink, [arf])
      #v(0.35em)
      #text(size: 0.65em, fill: muted, [インストール済みパッケージの\ ヘルプを端末で表示])
    ],
  )
  #v(1.05em)
  #quote([単体ツールとして作った変換処理が、別の体験を支えた])
]
