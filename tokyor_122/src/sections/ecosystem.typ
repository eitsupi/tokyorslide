#import "../theme.typ": *
#import "../components.typ": *
#import "../slide-components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([], [ADBCのこの1年])

#slide(title: [ドライバーは言語をまたいで使える])[
  #align(center, cell([Goで実装したSnowflakeドライバー]))
  #down()
  #v(-0.35em)
  #align(center, cell([共有ライブラリ], sub: [.so / .dylib / .dll], color: warm))
  #down()
  #v(-0.35em)
  #align(center, cell([ADBC Driver Manager], sub: [動的に読み込む]))
  #v(0.10em)
  #align(center, cell([さまざまな言語・アプリのADBCクライアント]))
  #sources([#source([ADBC Drivers], "https://arrow.apache.org/adbc/current/driver/index.html") · 接続例：#source([ADBC公式ドキュメント], "https://arrow.apache.org/adbc/current/") ／ #source([Columnar社 adbc-quickstarts], "https://github.com/columnar-tech/adbc-quickstarts")])
]

#slide(title: [ドライバーをどう配る？])[
  #text(size: 0.82em, [Driver Managerで使うには、共有ライブラリの配布・インストールが必要。])
  #v(0.58em)
  #grid(columns: (1fr, auto, 1fr, auto, 1fr), column-gutter: 0.30em, align: horizon,
    cell([dbc]), arrow(), cell([ドライバー + 設定情報]), arrow(), cell([Driver Manager]),
  )
  #v(0.63em)
  #code-panel(raw("dbc install sqlite\ndbc install snowflake", lang: "sh", block: true))
  #v(0.35em)
  #text(size: 0.82em, fill: muted, [dbcはコマンドとして使えるほか、0.3.0からGoのライブラリとしてアプリにも組み込める。])
  #sources([#source([ADBC Drivers: installation], "https://arrow.apache.org/adbc/current/driver/index.html") · #source([dbc 0.3.0], "https://columnar.tech/blog/announcing-dbc-0.3.0/")])
]

#slide(title: [2025–2026年の動き])[
  #label([2025.10], [dbcとADBC Driver Foundryが登場])
  #v(0.31em)
  #label([2026.05], [dbc 0.3.0：Goのライブラリとして利用可能に])
  #v(0.31em)
  #label([2026.07], [ADBC 24：一部ドライバーの開発がFoundryへ])
  #v(0.31em)
  #label([2026.10.01], [dbc 0.3.1がリリース（一昨日）])
  #v(0.47em)
  #text(size: 0.80em, fill: muted, [FoundryはApache Arrowから独立したコミュニティプロジェクト。Apache ArrowはADBCの中核と仕様を維持。])
  #sources([#source([Columnar社ローンチ], "https://columnar.tech/blog/announcing-columnar/") · #source([dbc 0.3.0], "https://columnar.tech/blog/announcing-dbc-0.3.0/") · #source([ADBC 24], "https://arrow.apache.org/blog/2026/07/28/adbc-24-release/") · #source([dbc 0.3.1], "https://columnar.tech/blog/dbc-0.3.1/")])
]

#slide(title: [dbt v2もADBCを採用])[
  #grid(columns: (1fr, 1fr), column-gutter: 0.85em,
    [
      #text(size: 0.86em, fill: muted, [dbt v1])
      #v(0.38em)
      #cell([adapter A → 接続実装 A])
      #v(0.25em)
      #cell([adapter B → 接続実装 B])
    ],
    [
      #text(size: 0.86em, fill: accent, [dbt v2])
      #v(0.38em)
      #cell([dbt / Rust])
      #down()
      #v(-0.22em)
      #cell([ADBC])
      #down()
      #v(-0.22em)
      #cell([各DBのドライバー], sub: [Go実装なども利用可能])
    ],
  )
  #v(0.10em)
  #note([言語をまたいで使えるドライバーの仕組みが、製品の共通接続層に使われている。])
  #sources([#source([dbt: Arrow ADBC and dbt v2], "https://docs.getdbt.com/docs/dbt/adbc") · #source([dbt v2 GA], "https://docs.getdbt.com/blog/dbt-v2-is-ga")])
]
