#import "../theme.typ": *
#import "../components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([03], [jgd], subtitle: [描画するRパッケージと、表示するRendererを分ける])

#slide(title: [Rのプロットを、軽い仕組みで外へ])[
  #full-image("/tokyor_121/src/images/jgd.png", height: 10.8em, fit: "contain")
  #v(0.4em)
  #align(center, text(size: 0.56em, fill: muted, [Rで描く → 外部Rendererがリアルタイムに表示]))
]

#slide(title: [なぜ、デバイスとRendererを分ける？])[
  #two-columns(
    [
      #text(size: 1.05em, weight: "bold", fill: ink, [従来の悩み])
      #v(0.65em)
      #feature-list(
        [Rパッケージ内にC++描画スタックとHTTPサーバー],
        [ビルドとツールチェーンの負担が大きい],
        [表示先ごとに仕組みが密結合],
      )
    ],
    [
      #text(size: 1.05em, weight: "bold", fill: accent-dark, [jgdの分け方])
      #v(0.65em)
      #feature-list(
        [R側はC製・外部依存なし],
        [描画命令をJSONへ変換],
        [RendererはVS CodeでもBrowserでもよい],
      )
    ],
  )
]

#slide(title: [jgd のアーキテクチャ])[
  #two-columns(
    [
      #architecture-flow(
        flow-node([ggplot / base graphics], subtitle: [R plotting code]),
        flow-node([R Graphics API], subtitle: [device callbacks]),
        flow-node([jgd], subtitle: [pure C · zero dependency], color: warm),
        flow-node([JSONL], subtitle: [socket / named pipe / TCP]),
        flow-node([Renderer], subtitle: [VS Code · Browser · future clients]),
      )
    ],
    [
      #align(horizon, [
        #quote([jgd自身は描画しない。\ 描画命令を記録して、外へ渡す。])
        #v(0.85em)
        #grid(
          columns: (1fr, 1fr), gutter: 0.55em,
          metric([C], [R package], color: warm),
          metric([JSON], [protocol], color: accent),
        )
      ])
    ],
    ratio: (0.9fr, 1.1fr),
  )
]

#slide(title: [表示先を選べる])[
  #grid(
    columns: (1fr, 1fr, 1fr), column-gutter: 0.7em,
    feature-card([VS Code], body: [R Extensionのplot pane]),
    feature-card([Browser], body: [Deno reference server]),
    feature-card([Your client], body: [JSONを読めればよい]),
  )
  #v(1.0em)
  #quote([R側を軽く保ち、フロントエンドに自由を残す])
  #v(0.8em)
  #code-panel[
```r
install.packages("jgd")
jgd::jgd()
plot(cars)
```
  ]
]

#slide(title: [arf が jgd のテスト基盤に])[
  #grid(
    columns: (1fr, auto, 1fr, auto, 1fr), column-gutter: 0.45em, align: horizon,
    feature-card([arf headless], body: [端末なしでRを起動]),
    text(size: 1.0em, weight: "bold", fill: accent, [→]),
    feature-card([IPC eval], body: [描画コードを送信]),
    text(size: 1.0em, weight: "bold", fill: accent, [→]),
    feature-card([jgd E2E], body: [resizeも自動検証]),
  )
  #v(1.0em)
  #quote([難しかったリサイズ周りを、再現可能なテストにできた])
]
