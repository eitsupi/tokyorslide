#import "../theme.typ": *
#import "../components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([01], [arf], subtitle: [radianを置き換える、Rust製Rコンソール])

#slide(title: [なぜ、新しいRコンソール？])[
  #two-columns(
    [
      #text(size: 1.25em, weight: "bold", fill: ink, [radianは好き。\ でも…])
      #v(0.7em)
      #feature-list(
        [Python環境に依存する],
        [Rの切替や配布を、もっと単純にしたい],
        [外部ツールからRセッションを操作したい],
      )
    ],
    [
      #quote([欲しかったのは、インストールしてすぐ使えるR frontend])
      #v(0.75em)
      #grid(
        columns: (1fr, 1fr), gutter: 0.55em,
        metric([1], [single binary]), metric([3], [major OS]),
      )
    ],
    ratio: (1.1fr, 0.9fr),
  )
]

#slide(title: [まず、普段使えること])[
  #image-with-note(
    "/tokyor_121/src/images/arf-2.png",
    [
      #pill([:switch])
      #v(0.5em)
      #text(size: 0.95em, weight: "bold", fill: ink, [その場でRを切り替える])
      #v(0.45em)
      #text(size: 0.64em, fill: muted, [rigと連携。\ 再起動までarfの中で完結。])
    ],
  )
]

#slide(title: [履歴は「あいまいに」探す])[
  #image-with-note(
    "/tokyor_121/src/images/arf-3.png",
    [
      #pill([Ctrl + R])
      #v(0.5em)
      #text(size: 0.95em, weight: "bold", fill: ink, [前に書いたコードをすぐ戻す])
      #v(0.45em)
      #text(size: 0.64em, fill: muted, [通常のRやradianの履歴も取り込み可能。])
    ],
  )
]

#slide(title: [Help Browserをコンソールの中に])[
  #two-columns(
    [
      #framed-image("/tokyor_121/src/images/arf-4.png", height: 9.4em)
      #v(0.35em)
      #align(center, text(size: 0.54em, fill: muted, [:help で全パッケージをあいまい検索]))
    ],
    [
      #framed-image("/tokyor_121/src/images/arf-6.png", height: 9.4em)
      #v(0.35em)
      #align(center, text(size: 0.54em, fill: muted, [RdをMarkdownとして読みやすく表示]))
    ],
    gutter: 0.85em,
  )
]

#slide(title: [端末の外から、Rを動かす])[
  #image-with-note(
    "/tokyor_121/src/images/arf-5.png",
    [
      #pill([IPC + Headless])
      #v(0.5em)
      #text(size: 0.95em, weight: "bold", fill: ink, [同じRセッションへ送る・評価する])
      #v(0.5em)
      #feature-list([IDEとの統合], [CIでの実行], [E2Eテストの自動化])
    ],
    ratio: (1.6fr, 0.7fr),
  )
]

#slide(title: [配布はシングルバイナリ])[
  #two-columns(
    [
      #text(size: 1.05em, weight: "bold", fill: ink, [使い始めるまでを短く])
      #v(0.75em)
      #feature-card([Windows], body: [#raw("winget install --id eitsupi.arf")])
      #v(0.5em)
      #feature-card([macOS / Linux], body: [#raw("brew install arf")])
    ],
    [
      #framed-image("/tokyor_121/src/images/arf-1.png", height: 9.0em)
      #v(0.45em)
      #align(center, pill([Rust · no runtime dependency]))
    ],
    ratio: (0.85fr, 1.15fr),
  )
]
