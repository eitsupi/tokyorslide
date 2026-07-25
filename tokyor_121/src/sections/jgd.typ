#import "../theme.typ": *
#import "../components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([03], [jgd], subtitle: [JSONを出力するRグラフィックデバイス])

#slide(title: [着想], align: left + horizon)[
  #two-columns(
    [
      #text(size: 0.9em, weight: "bold", [httpgd])
      #v(0.5em)
      #feature-list(
        [C++製の描画処理とHTTPサーバーをRパッケージに同梱],
        [環境によってはソースビルドが大変],
      )
    ],
    [
      #text(size: 0.9em, weight: "bold", [jgd])
      #v(0.5em)
      #feature-list(
        [Rパッケージ側はC製・外部依存なし],
        [描画命令をJSONに変換して外部サーバーへ送信],
        [Grant氏がjgdを公開した際に衝撃を受け、「これだ！」と思い開発に参加],
      )
    ],
  )
]

#section-title([], [機能紹介], subtitle: [jgd])

#slide(title: [動作例])[
  #align(center, image("/tokyor_121/src/images/jgd.png", width: 93%))
  #v(0.25em)
  #align(center, text(size: 0.52em, fill: muted, [画像は開発途中のターミナルグラフィックス対応レンダラー（未公開）]))
]

#slide(title: [アーキテクチャ])[
  #two-columns(
    [
      #architecture-flow(
        flow-node([ggplot / base graphics]),
        flow-node([R Graphics API]),
        flow-node([jgd], subtitle: [C · zero dependency], color: warm),
        flow-node([JSONL], subtitle: [socket / named pipe / TCP]),
        flow-node([Renderer], subtitle: [VS Code / Browser / etc.]),
      )
    ],
    [
      #align(horizon, [
        #feature-list(
          [jgd自身は描画しません],
          [Rの描画命令を記録してJSONへ変換します],
          [Renderer側が実際の描画を行います],
        )
      ])
    ],
    ratio: (0.9fr, 1.1fr),
  )
]

#slide(title: [Renderer], align: left + horizon)[
  #two-columns(
    [
      #feature-list(
        [VS Code R Extension],
        [Deno製のブラウザー向けサーバー],
        [JSONを扱えれば他のクライアントも実装可能],
        [リサイズやplot historyにも対応],
      )
    ],
    [
      #code-panel[
```r
install.packages("jgd")

jgd::jgd()
plot(cars)
```
      ]
    ],
    align: horizon,
  )
]

#slide(title: [jgdのテスト], align: left + horizon)[
  #grid(
    columns: (1fr, auto, 1fr, auto, 1fr),
    column-gutter: 0.45em,
    align: horizon,
    [#text(size: 0.82em, weight: "bold", [arf headless]) #v(0.2em) #text(size: 0.58em, fill: muted, [端末なしでRを起動])],
    text(size: 1.0em, fill: accent, [→]),
    [#text(size: 0.82em, weight: "bold", [IPC eval]) #v(0.2em) #text(size: 0.58em, fill: muted, [描画コードを送信])],
    text(size: 1.0em, fill: accent, [→]),
    [#text(size: 0.82em, weight: "bold", [jgd E2E]) #v(0.2em) #text(size: 0.58em, fill: muted, [resizeなどを自動検証])],
  )
  #v(1.0em)
  #text(size: 0.72em, [arfのHeadlessモードを追加したことで、jgdのテストを自動化できました。])
]
