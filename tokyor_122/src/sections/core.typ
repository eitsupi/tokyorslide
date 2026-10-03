#import "../theme.typ": *
#import "../components.typ": *
#import "../slide-components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([], [Apache Arrowとは])

#slide(title: [フォーマットのN×M問題])[
  #text(size: 0.88em, [バラバラの形式を直接つなぐと、変換がN×Mに増える。])
  #v(0.46em)
  #grid(columns: (1fr, 1fr), column-gutter: 0.55em,
    [
      #text(size: 0.84em, weight: "bold", fill: warm, [共通形式なし])
      #v(0.16em)
      #rect(width: 100%, fill: white, inset: 0.12em)[#image("../../assets/arrow-copy.png", width: 100%, height: 9em, fit: "contain")]
    ],
    [
      #text(size: 0.84em, weight: "bold", fill: accent, [Apache Arrowが共通形式に])
      #v(0.16em)
      #rect(width: 100%, fill: white, inset: 0.12em)[#image("../../assets/arrow-shared.png", width: 100%, height: 9em, fit: "contain")]
    ],
  )
  #v(0.40em)
  #note([Apache Arrowを中心に受け渡すと、個別のCopy & Convertを減らせる。])
  #sources([図の出典：#source([Apache Arrow公式Overview], "https://arrow.apache.org/overview/")])
]

#slide(title: [Apache Arrowが標準化したもの])[
  #label([columnar], [列ごとに並ぶメモリ上のデータ形式])
  #v(0.42em)
  #label([言語非依存], [言語をまたぐ共通の表現])
  #v(0.42em)
  #label([C Data Interface], [異なる言語・実装間でデータを受け渡す仕組み])
  #v(0.68em)
  #note([Parquetは保存するファイル形式。Apache Arrowは主にメモリ上の共通表現。])
  #sources([#source([Apache Arrow Overview], "https://arrow.apache.org/overview/") · #source([C Data Interface], "https://arrow.apache.org/docs/format/CDataInterface.html")])
]

#slide(title: [Apache Arrowは10周年。Rでも当たり前に使える])[
  #label([2019年], [
    #source([そろそろRユーザーもApache ArrowでParquetを使ってみませんか？], "https://notchained.hatenablog.com/entry/2019/12/17/213356")
    #v(0.14em)
    #text(fill: warm, [「CSVをやめて人間を続けよう」])
  ])
  #v(0.63em)
  #label([2026年], [Apache Arrowは10周年。#linebreak()RではdbplyrからADBC（後述）が利用可能に。])
  #v(0.75em)
  #note([「使ってみませんか？」から、Rでも普段使うデータ基盤へ。])
  #sources([#source([Apache Arrow 10周年], "https://arrow.apache.org/blog/2026/02/12/arrow-anniversary/") · #source([dbplyr 2.6.0], "https://opensource.posit.co/blog/2026-06-17_dbplyr-2-6-0/")])
]

#section-title([], [Apache Arrow ADBCとは])

#slide(title: [接続にもN×M問題がある])[
  #grid(
    columns: (1fr, auto, 1fr), column-gutter: 0.75em, align: horizon,
    cell([アプリ・言語 N個], sub: [多様なクライアント]),
    text(size: 1.3em, fill: warm, [N × M]),
    cell([データベース M個], sub: [さまざまな接続先]),
  )
  #v(0.72em)
  #text(size: 0.86em, weight: "bold", [BigQuery · Snowflake · Databricks · PostgreSQL · DuckDB · SQLite …])
  #v(0.68em)
  #note([ADBCはアプリとdriverの間の共通APIを定める。各DB向けのdriverはまだ必要。])
  #sources([#source([ADBC FAQ], "https://arrow.apache.org/adbc/current/faq.html") · #source([ADBC Glossary], "https://arrow.apache.org/adbc/current/glossary.html") · #source([Columnar社 ADBC Quickstarts], "https://github.com/columnar-tech/adbc-quickstarts")])
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

#section-title([], [ODBC / JDBCとの違い])

#slide(title: [30年続く接続API])[
  #label([1995], [ODBCはすでに利用されていた])
  #v(0.50em)
  #label([1996], [JDBCが登場])
  #v(0.50em)
  #label([2022ごろ], [Apache Arrowを土台にADBCが生まれる])
  #v(0.78em)
  #note([Columnar社のローンチ記事は「接続規格が長く使われる」ことから話を始める。])
  #sources([#source([Columnar社: Announcing Columnar (2025-10-29)], "https://columnar.tech/blog/announcing-columnar/")])
]

#slide(title: [3つともdatabase client API])[
  #v(0.18em)
  #grid(columns: (0.18fr, 0.82fr), row-gutter: 0.72em, column-gutter: 0.5em,
    text(weight: "bold", fill: accent, [JDBC]), [ResultSetが基本。行ベースのAPI。],
    text(weight: "bold", fill: accent, [ODBC]), [行・列のbindingが可能。Apache Arrow形式は共通契約ではない。],
    text(weight: "bold", fill: accent, [ADBC]), [Apache Arrowをデータ交換の中心に置く。],
  )
  #v(0.70em)
  #note([3つともwire protocolは決めない。ADBCはODBC/JDBCの全面的な置き換えを約束しない。])
  #sources([#source([ADBC FAQ: Why not JDBC/ODBC?], "https://arrow.apache.org/adbc/current/faq.html")])
]

#section-title([], [Flight SQLとの違い])

#slide(title: [Flight SQLとは？])[
  #text(size: 0.88em, [Apache Arrow Flightの上でSQLを扱う通信protocol。DB側にも対応が必要。])
  #v(0.55em)
  #align(center, cell([SQL client]))
  #down()
  #align(center, cell([Flight SQL], sub: [SQL命令・metadata ＋ Apache Arrowのデータ], color: warm))
  #down()
  #align(center, cell([Flight SQL対応DB]))
  #sources([#source([Apache Arrow: Flight SQL specification], "https://arrow.apache.org/docs/format/FlightSql.html") · #source([Flight SQL発表（2022年）], "https://arrow.apache.org/blog/2022/02/16/introducing-arrow-flight-sql/")])
]

#slide(title: [ADBCと何が違う？])[
  #text(size: 0.82em, fill: muted, [どちらも「SQL」と「Apache Arrow」を扱うので、似て見える。])
  #v(0.39em)
  #label([データ表現], [Apache Arrow])
  #v(0.38em)
  #label([client API], [ADBC / ODBC / JDBC])
  #v(0.38em)
  #label([wire protocol], [Flight SQL / PostgreSQL protocol / TDS / Quack])
  #v(0.55em)
  #note([ADBCはclient側のAPI。driverがどのprotocolでDBと話すかは決めない。])
  #sources([#source([ADBC Glossary], "https://arrow.apache.org/adbc/current/glossary.html") · #source([ADBC FAQ: Flight SQL], "https://arrow.apache.org/adbc/current/faq.html") · #source([ADBC？ Flight SQL？], "https://zenn.dev/yutannihilation/articles/48fec15ddc565d")])
]

#slide(title: [Flight SQLとADBCは競合しない])[
  #align(center, cell([アプリ → ADBC API], color: accent))
  #down()
  #grid(columns: (1fr, 1fr), column-gutter: 0.80em,
    [#cell([Flight SQL driver]) #down() #cell([Flight SQL protocol], color: warm) #down() #cell([Flight SQL対応DB])],
    [#cell([Quack driver]) #down() #cell([Quack protocol], color: warm) #down() #cell([DuckDB server])],
  )
  #sources([#source([ADBC FAQ], "https://arrow.apache.org/adbc/current/faq.html") · #source([Columnar社: Quack ADBC driver], "https://columnar.tech/blog/announcing-quack-adbc-driver/")])
]

#slide(title: [Flight SQLにも設計上のトレードオフ])[
  #text(size: 0.86em, [2022年登場のFlight SQL。クエリの結果取得には、少なくとも2回の通信が必要。])
  #v(0.58em)
  #align(center, cell([① GetFlightInfo], sub: [SQLを送り、結果の取得先を受け取る]))
  #down()
  #align(center, cell([② DoGet], sub: [結果データを取得する], color: warm))
  #v(0.57em)
  #note([小さなクエリを多数実行する用途では、この2往復は効率が悪い。])
  #text(size: 0.80em, fill: muted, [仕様見直しのissue「Flight SQL evolution」は2024年に作成され、現在もopen。])
  #sources([#source([Flight SQL specification], "https://arrow.apache.org/docs/format/FlightSql.html") · #source([DuckDB: Why Not Arrow Flight SQL?], "https://duckdb.org/2026/05/12/quack-remote-protocol") · #source([Apache Arrow #41840], "https://github.com/apache/arrow/issues/41840")])
]

#slide(title: [Flight SQLがいつも最速とは限らない])[
  #text(size: 0.86em, [DuckDBがQuackを発表したときの転送時間の比較。])
  #v(0.56em)
  #grid(columns: (1fr, 1fr), column-gutter: 0.70em,
    [#cell([Quack], sub: [4.94秒], color: accent)],
    [#cell([Flight SQL / GizmoSQL], sub: [17.40秒], color: warm)],
  )
  #v(0.57em)
  #text(size: 0.80em, fill: muted, [TPC-H lineitem 6,000万行のread。AWS Arm同一AZ、5回の中央値。サーバー実装も異なる特定条件での比較で、ADBC自体の性能比較ではない。])
  #v(0.38em)
  #note([ADBCは通信方式を決めない。QuackもFlight SQLも、対応driverを通して使える。])
  #sources([#source([DuckDB: Quack remote protocol (2026-05-12)], "https://duckdb.org/2026/05/12/quack-remote-protocol")])
]
