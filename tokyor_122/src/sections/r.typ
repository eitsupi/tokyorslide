#import "../theme.typ": *
#import "../components.typ": *
#import "../slide-components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([], [Rから使う])

#slide(title: [いまのRでの経路])[
  #grid(columns: (0.37fr, 0.63fr), row-gutter: 0.94em, column-gutter: 0.35em,
    text(fill: accent, weight: "bold", [dplyr → dbplyr]), [操作をSQLへ翻訳],
    text(fill: accent, weight: "bold", [DBI → adbi]), [DBI互換の接続・実行],
    text(fill: accent, weight: "bold", [adbcdrivermanager]), [ドライバーを読み込む],
    text(fill: accent, weight: "bold", [ADBCドライバー]), [接続先DBと通信],
  )
  #v(0.68em)
  #note([adbiのおかげで、既存のdplyr / dbplyrコードからADBCを利用できる。])
  #text(size: 0.78em, fill: muted, [DBIにもApache Arrow APIがあり、adbiは `dbGetQueryArrow()` などを実装している。])
  #sources([#source([adbi README: Apache Arrow API], "https://github.com/r-dbi/adbi") · #source([ADBC R client], "https://arrow.apache.org/adbc/current/r/index.html")])
]

#slide(title: [SQLiteで試す])[
  #text(size: 0.82em, fill: muted, [準備：dbc install sqlite。adbi、adbcdrivermanager、DBI、dplyr、dbplyrを使用。])
  #v(0.22em)
  #code-panel(raw("con <- DBI::dbConnect(\n  adbi::adbi(adbcdrivermanager::adbc_driver(\"sqlite\")),\n  uri = \":memory:\"\n)\nDBI::dbWriteTable(con, \"mtcars\", mtcars)\ndplyr::tbl(con, \"mtcars\") |>\n  dplyr::filter(cyl == 6) |>\n  dplyr::summarise(n = dplyr::n(), avg_mpg = mean(mpg, na.rm = TRUE)) |>\n  dplyr::collect()\nDBI::dbDisconnect(con)", lang: "r", block: true))
  #v(0.28em)
  #text(size: 0.82em, fill: accent, [結果：n = 7、avg_mpg = 19.7])
  #sources([#source([ADBC Drivers], "https://arrow.apache.org/adbc/current/driver/index.html") · #source([adbi README], "https://github.com/r-dbi/adbi")])
]

#slide(title: [接続クラスとSQL方言を結び付ける限界])[
  #grid(columns: (1fr, 1fr), column-gutter: 0.80em,
    [
      #text(size: 0.85em, fill: muted, [従来の自然な前提])
      #v(0.30em)
      #cell([RPostgresConnection]) #down() #cell([PostgreSQL方言], color: warm)
    ],
    [
      #text(size: 0.85em, fill: accent, [汎用の接続APIでは])
      #v(0.30em)
      #cell([AdbiConnection]) #down() #cell([PostgreSQL / SQLite / Snowflake], color: warm)
    ],
  )
  #v(0.65em)
  #note([ODBC/JDBC/ADBCでは、接続クラスだけでは接続先のSQL方言が決まらない。])
  #sources([#source([Posit社: dbplyr 2.6.0], "https://opensource.posit.co/blog/2026-06-17_dbplyr-2-6-0/")])
]

#slide(title: [dbplyr 2.6.0でSQL方言を分離])[
  #align(center, cell([AdbiConnection]))
  #down()
  #align(center, cell([ADBC_INFO_VENDOR_NAME], sub: [ドライバーに接続先の製品名を問い合わせる], color: warm))
  #down()
  #align(center, cell([sql_dialect()], sub: [PostgreSQL → dialect_postgres() など], color: accent))
  #v(0.45em)
  #text(size: 0.80em, fill: muted, [dbplyrは接続先の製品名からSQL方言を選ぶ。未対応なら汎用ODBC方言のdialect_odbc()へ。])
  #sources([#source([dbplyr backend-adbc.R], "https://github.com/tidyverse/dbplyr/blob/main/R/backend-adbc.R") · #source([dbplyr sql-dialect.R], "https://github.com/tidyverse/dbplyr/blob/main/R/sql-dialect.R")])
]

#slide(title: [接続を作るだけで3つのパッケージの関数が必要！？])[
  #text(size: 0.85em, [先ほどのSQLite例から、接続部分だけを抜き出すと…])
  #v(0.30em)
  #code-panel(raw("con <- DBI::dbConnect(\n  adbi::adbi(\n    adbcdrivermanager::adbc_driver(\"sqlite\")\n  ),\n  uri = \":memory:\"\n)", lang: "r", block: true))
  #v(0.36em)
  #grid(columns: (1fr, 1fr, 1fr), column-gutter: 0.45em,
    [#text(size: 0.80em, fill: accent, weight: "bold", [adbcdrivermanager]) #v(0.08em) #text(size: 0.75em, [ドライバーを指定])],
    [#text(size: 0.80em, fill: accent, weight: "bold", [adbi]) #v(0.08em) #text(size: 0.75em, [DBIにつなぐ])],
    [#text(size: 0.80em, fill: accent, weight: "bold", [DBI]) #v(0.08em) #text(size: 0.75em, [接続を作る])],
  )
  #v(0.16em)
  #note([adbiは有用な互換レイヤー。ただ、dbplyrからADBCへ進む実行経路は複雑。])
  #text(size: 0.80em, fill: accent, [→ 個人的には、dbplyrがADBCをDBIと並ぶ実行バックエンドとして直接扱えるとうれしい。])
  #sources([#source([adbi README], "https://github.com/r-dbi/adbi") · #source([ADBC R client], "https://arrow.apache.org/adbc/current/r/index.html")])
]
