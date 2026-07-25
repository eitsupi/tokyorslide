#import "../theme.typ": *
#import "../components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([01], [arf], subtitle: [Rust製のRコンソール])

#slide(title: [着想])[
  #centered-body[
    #text(size: 1.0em, weight: "bold", [radianを置き換えたい])
    #v(0.7em)
    #feature-list(
      [radianを何年も使っていたが、Python製なのが嫌だった],
      [「ArkとNushellを組み合わせればできるのでは？」というところから開始],
    )
  ]
]

#slide(title: [インストール])[
  #two-columns(
    [
      #text(size: 0.78em, [シングルバイナリなので、GitHubからダウンロードするかパッケージマネージャーでインストールできます。])
      #v(0.8em)
      #text(size: 0.62em, weight: "bold", [Windows])
      #v(0.2em)
      #raw(block: true, lang: "sh", "winget install --id eitsupi.arf")
      #v(0.55em)
      #text(size: 0.62em, weight: "bold", [macOS / Linux])
      #v(0.2em)
      #raw(block: true, lang: "sh", "brew install arf")
    ],
    [#framed-image("/tokyor_121/src/images/arf-1.png")],
    ratio: (0.9fr, 1.1fr),
    align: horizon,
  )
]

#section-title([], [機能紹介], subtitle: [arf])

#slide(title: [Rバージョン切り替え])[
  #image-with-note(
    "/tokyor_121/src/images/arf-2.png",
    [
      #text(size: 0.95em, weight: "bold", [:switch])
      #v(0.45em)
      #text(size: 0.68em, [rigと連携してRのバージョンを切り替え])
    ],
  )
]

#slide(title: [履歴・自動補完])[
  #image-with-note(
    "/tokyor_121/src/images/arf-3.png",
    [
      #text(size: 0.82em, weight: "bold", [履歴を使った自動補完])
      #v(0.35em)
      #feature-list(
        [fish風の履歴補完],
        [通常のRやradianから履歴を取り込み可能],
        [Ctrl+Rで履歴をあいまい検索],
      )
      #v(0.35em)
      #text(size: 0.52em, fill: muted, [履歴検索とHelp Browserはどちらもあいまい検索に対応])
    ],
    ratio: (1.45fr, 0.85fr),
  )
]

#slide(title: [Help Browser])[
  #text(size: 0.65em, [Atusy氏が作成したfelpパッケージから着想を得ました。])
  #v(0.55em)
  #two-columns(
    [
      #framed-image("/tokyor_121/src/images/arf-4.png")
      #v(0.3em)
      #align(center, text(size: 0.5em, fill: muted, [全パッケージをあいまい検索]))
    ],
    [
      #framed-image("/tokyor_121/src/images/arf-6.png")
      #v(0.3em)
      #align(center, text(size: 0.5em, fill: muted, [RdをMarkdownに変換して表示]))
    ],
    gutter: 0.85em,
  )
]

#slide(title: [IPC・Headless])[
  #image-with-note(
    "/tokyor_121/src/images/arf-5.png",
    [
      #text(size: 0.9em, weight: "bold", [外部からRセッションを操作])
      #v(0.5em)
      #feature-list(
        [コマンド送信],
        [コードの評価],
        [端末なしで起動],
      )
    ],
    ratio: (1.6fr, 0.7fr),
  )
]
