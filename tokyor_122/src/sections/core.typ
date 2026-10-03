#import "../theme.typ": *
#import "../components.typ": *
#import "../slide-components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([], [Apache Arrowとは], subtitle: [まずは「データの形」の話])

#slide(title: [フォーマットのN×M問題])[
  #text(size: 0.86em, [データを作る側も使う側も増えると、変換の組み合わせが増える。])
  #v(0.65em)
  #grid(
    columns: (1fr, auto, 1fr), column-gutter: 0.75em, align: horizon,
    [#cell([システム N個], sub: [DB・処理エンジン・言語])],
    text(size: 1.3em, fill: warm, [N × M]),
    [#cell([利用先 M個], sub: [分析・可視化・機械学習])],
  )
  #v(0.78em)
  #note([それぞれを直接つなぐと、形式の変換を何度も実装することになる。])
  #sources([#source([Apache Arrow Overview], "https://arrow.apache.org/overview/")])
]

#slide(title: [Arrowが共通のデータ表現になる])[
  #grid(
    columns: (1fr, auto, 1fr, auto, 1fr), column-gutter: 0.30em, align: horizon,
    cell([DB・エンジン]), arrow(), cell([Apache Arrow], color: accent), arrow(), cell([R・Python・Rust]),
  )
  #v(0.85em)
  #label([columnar], [列ごとに並ぶメモリ上のデータ形式])
  #v(0.26em)
  #label([言語非依存], [言語をまたぐ共通の表現])
  #v(0.26em)
  #label([C Data Interface], [Arrowのデータをライブラリ間で受け渡す入口])
  #v(0.48em)
  #text(size: 0.72em, fill: accent, [Arrowは主要なデータ基盤で使われる共通形式として定着。])
  #v(0.22em)
  #text(size: 0.72em, fill: muted, [Parquetはファイル形式。Arrowのメモリ上の表現とは役割が違う。])
  #sources([#source([Arrow Overview], "https://arrow.apache.org/overview/") · #source([C Data Interface], "https://arrow.apache.org/docs/format/CDataInterface.html") · #source([Columnar launch], "https://columnar.tech/blog/announcing-columnar/")])
]

#section-title([], [Arrow ADBCとは], subtitle: [今度は「接続の仕方」の話])

#slide(title: [接続にもN×M問題がある])[
  #grid(
    columns: (1fr, auto, 1fr), column-gutter: 0.75em, align: horizon,
    cell([アプリ・言語 N個], sub: [R / Python / Rust / dbt]),
    text(size: 1.3em, fill: warm, [N × M]),
    cell([データベース M個], sub: [PostgreSQL / Snowflake / ...]),
  )
  #v(0.80em)
  #note([ADBCはアプリとdriverの間の共通APIを定める。各DB向けのdriverはまだ必要。])
  #sources([#source([ADBC FAQ], "https://arrow.apache.org/adbc/current/faq.html") · #source([ADBC Glossary], "https://arrow.apache.org/adbc/current/glossary.html")])
]

#slide(title: [ADBCは何を決める？])[
  #text(size: 0.92em, weight: "bold", fill: accent, [Arrow Database Connectivity])
  #v(0.22em)
  #text(size: 0.86em, [Arrow-nativeなdatabase client API])
  #v(0.70em)
  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 0.35em, row-gutter: 0.35em,
    cell([connection]), cell([statement]), cell([query execution]),
    cell([metadata]), cell([transaction]), cell([bulk ingest]),
  )
  #v(0.56em)
  #note([SQL dialectも、clientとDBの通信方式も定義しない。])
  #sources([#source([ADBC FAQ], "https://arrow.apache.org/adbc/current/faq.html") · #source([ADBC API Standard], "https://arrow.apache.org/adbc/current/format/specification.html")])
]

#section-title([], [ODBC / JDBCとの違い], subtitle: [古い規格を雑に悪者にしない])

#slide(title: [30年続く接続API])[
  #label([1995], [ODBCはすでに利用されていた])
  #v(0.50em)
  #label([1996], [JDBCが登場])
  #v(0.50em)
  #label([2022ごろ], [Arrowを土台にADBCが生まれる])
  #v(0.78em)
  #note([Columnarのローンチ記事は「接続規格が長く使われる」ことから話を始める。])
  #sources([#source([Columnar: Announcing Columnar (2025-10-29)], "https://columnar.tech/blog/announcing-columnar/")])
]

#slide(title: [3つともdatabase client API])[
  #grid(columns: (0.18fr, 0.82fr), row-gutter: 0.40em, column-gutter: 0.5em,
    text(weight: "bold", fill: accent, [JDBC]), [ResultSetが基本。行ベースのAPI。],
    text(weight: "bold", fill: accent, [ODBC]), [行・列のbindingが可能。Arrow形式は共通契約ではない。],
    text(weight: "bold", fill: accent, [ADBC]), [Arrowをデータ交換の中心に置く。],
  )
  #v(0.70em)
  #note([どれも基本的にはwire protocolを規定しない。ADBCは全面的な置き換えを約束するものでもない。])
  #sources([#source([ADBC FAQ: Why not JDBC/ODBC?], "https://arrow.apache.org/adbc/current/faq.html")])
]

#section-title([], [Flight SQLとの違い], subtitle: [APIと通信方式は別の話])

#slide(title: [ADBCはwire protocolではない])[
  #label([データ表現], [Apache Arrow])
  #v(0.38em)
  #label([client API], [ADBC / ODBC / JDBC])
  #v(0.38em)
  #label([wire protocol], [Flight SQL / PostgreSQL protocol / TDS / Quack])
  #v(0.70em)
  #note([ADBCはclient側のAPI。driverがどのprotocolでDBと話すかは決めない。])
  #sources([#source([ADBC Glossary], "https://arrow.apache.org/adbc/current/glossary.html") · #source([ADBC FAQ: Flight SQL], "https://arrow.apache.org/adbc/current/faq.html")])
]

#slide(title: [Flight SQLとADBCは競合しない])[
  #align(center, cell([アプリ → ADBC API], color: accent))
  #down()
  #grid(columns: (1fr, 1fr), column-gutter: 0.80em,
    [#cell([Flight SQL driver]) #down() #cell([Flight SQL protocol], color: warm) #down() #cell([Flight SQL対応DB])],
    [#cell([Quack driver]) #down() #cell([Quack protocol], color: warm) #down() #cell([DuckDB server])],
  )
  #sources([#source([ADBC FAQ], "https://arrow.apache.org/adbc/current/faq.html") · #source([Columnar: Quack ADBC driver], "https://columnar.tech/blog/announcing-quack-adbc-driver/")])
]

#slide(title: [Flight SQLがいつも最速とは限らない])[
  #text(size: 0.78em, [DuckDBがQuackを発表したときの転送時間の比較。])
  #v(0.56em)
  #grid(columns: (1fr, 1fr), column-gutter: 0.70em,
    [#cell([Quack], sub: [4.94秒], color: accent)],
    [#cell([Flight SQL / GizmoSQL], sub: [17.40秒], color: warm)],
  )
  #v(0.57em)
  #text(size: 0.70em, fill: muted, [TPC-H lineitem 6,000万行のread。AWS Arm同一AZ、5回の中央値。サーバー実装も異なる特定条件での比較。])
  #v(0.38em)
  #note([これはwire protocolと実装の比較。ADBC自体の性能比較ではない。])
  #sources([#source([DuckDB: Quack remote protocol (2026-05-12)], "https://duckdb.org/2026/05/12/quack-remote-protocol")])
]
