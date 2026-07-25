## 自己紹介

### 経歴

### 最近やってたこと

- 2025年: Japan.R 2025で発表したように、r-polarsを書いてた
- 2026年: Opus 4.5に衝撃を受け、完全にエージェンティックコーディングに系統
  → これまで手を出せなかったツール群を作成しまくる

### 最近やってたこと

自分がRを使う上で不便だったところを何とかしようとした

- arf: R端末、radianの置き換え（Rust）
- rd2qmd: Rdファイルのmd変換、pkgdownの置き換え（Rust）
- jgd: Rグラフィックデバイス、httpgdの置き換え（C、TypeScript、Go、Rust）
- ???: ???の置き換え（Rust）

### 最近やってたこと

arf、rd2qmd、jgdは関係していないように見えて進めるにつれて繋がってきたのが面白かった。

- rd2qmdで開発したRd→mdの変換をarfに組み込んで内蔵ヘルプブラウザーができた
- arfで学んだIPCの知識でjgdを大幅に強化、jgdの開発過程で着想を得たarfのヘッドレスモードによってjgdのテストを自動化できた

## [arf](https://github.com/eitsupi/arf)

### 機能紹介

#### インストール方法

シングルバイナリなのでGitHubからダウンロードするか、パッケージマネージャーでインストール可能

- `winget install --id eitsupi.arf` (Windows)
- `brew install arf` (macOS, Linux)

#### switch

Rバージョンを切り替えられる（好評）

#### 履歴検索

あいまい検索可能な履歴機能

#### ヘルプ検索

felpパッケージから着想を得た、あいまい検索可能なヘルプブラウザー

#### 履歴取り込み

通常Rやradianの履歴を取り込む機能で移行を簡単に

#### IPC

外部ツールからのコマンド送信（IDEやコーディングエージェントとの統合可能）

#### ヘッドレスモード

IPCと組み合わせることで端末なしでRセッションを操作可能

### 着想

- Radianを何年も使ってたが、Python製なのが嫌だった
- 「ArkとNushell組み合わせればできるのでは？」というところから開始

### 感想

想定以上にウケた

- めっちゃバグ報告貰えた
- radianがリタイア宣言した
- Posit社のブログでも言及された

### 感想

Rustエコシステムの足りないところを体感

- crosstermのWindowsサポート貧弱でびっくりした
    - arfのバグ修正のために修正提出されたが取り込まれる気配なし
- tokioがWindows上でUDSサポートしてない
- radianがaskpassのパスワード入力マスクする機能は再現できなかった

## [rd2qmd](https://github.com/eitsupi/rd2qmd)

### 機能紹介

- シングルバイナリCLI/Rustライブラリ
- Rdファイル（単体・Rパッケージソース）をqmd・mdに高速変換

### 機能紹介

```rd
\name{simple}
\alias{simple}
\title{A Simple Function}
\description{
This is a simple function for testing.
}
\usage{
simple(x, y = 1)
}
\arguments{
\item{x}{The first argument.}
\item{y}{The second argument, defaults to 1.}
}
\value{
Returns the sum of \code{x} and \code{y}.
}
\examples{
simple(1, 2)
simple(10)
}
```

````md
---
title: "A Simple Function"
pagetitle: "A Simple Function — simple"
aliases:
  - "simple"
---

## Description

This is a simple function for testing.

## Usage

```r
simple(x, y = 1)
```

## Arguments

::: {.list-table header-rows=1}

- - Argument
  - Description

- - `x`
  - The first argument.

- - `y`
  - The second argument, defaults to 1.

:::

## Value

Returns the sum of `x` and `y`.

## Examples

```{r}
simple(1, 2)
simple(10)
```
````

### 着想

- r-polarsのウェブサイトはaltdocで作っているが、Rdからmdへの変換が不正確なせいでイマイチなので直したかった
- Rdファイルを正確にMarkdownに変換する決定的実装は存在しない
- arf開発後に「Rustってファイル解析得意みたいだしAIに書かせれば行けるのでは？」と軽いノリで着手

### 感想

- arfにヘルプブラウザー搭載を思い付いたときにrd2qmdを作っていたおかげで良い感じの表示になって良かった
- r-polarsのウェブサイト作り直しは未完

## [jgd](https://github.com/grantmcdermott/jgd)

### 機能紹介

#### インストール方法

```r
install.packages("jgd")
```

### 機能紹介

- ソースビルドが一瞬で終わる計量Rパッケージ（外部依存なし）
- R上での描画命令をJSON形式に変換して外部サーバーに送信する
- 外部サーバーと通信することで画像のリサイズなども可能
- サーバー側は何でも良い（ターミナルグラフィックスも実現可能）

### 着想

- ブラウザ上にグラフィック表示する[httpgd](https://github.com/nx10/httpgd)がRパッケージとしてC++製のサーバーを同梱しているためにビルドが大変だったりするところ、Rパッケージ側は計量にしてサーバーを外部ソフトウェアに分離
    - 私も同じようなことをしたいと思っていたが、JSON形式で通信できるとは思ってなかった。私はGrantがjgdを発表したところに相乗りして仕様を詰めたり機能強化した
- Cで書くことでRパッケージはインストール簡単になる

### 感想

リサイズ周りのバグ取りが大変過ぎて地獄だったが
arfにヘッドレスモードを追加したらテストを完全に自動化できなければ永遠に終わらなかったかも知れない。arf開発してて良かった

## まとめ

ニッチなツールを色々作ったので良かったら触ってみてください🙏
