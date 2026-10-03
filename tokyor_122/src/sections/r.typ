#import "../theme.typ": *
#import "../components.typ": *
#import "../slide-components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([], [Rから使う], subtitle: [dbplyrとADBCの間で何が起きる？])

#slide(title: [いまのRでの経路])[
  #grid(columns: (0.37fr, 0.63fr), row-gutter: 0.22em, column-gutter: 0.35em,
    text(fill: accent, weight: "bold", [dplyr → dbplyr]), [操作をSQLへ翻訳],
    text(fill: accent, weight: "bold", [DBI → adbi]), [DBI互換の接続・実行],
    text(fill: accent, weight: "bold", [adbcdrivermanager]), [driverをload],
    text(fill: accent, weight: "bold", [ADBC driver]), [接続先DBと通信],
  )
  #v(0.68em)
  #note([adbiのおかげで、既存のdplyr / dbplyrコードからADBCを利用できる。])
  #sources([#source([adbi README], "https://github.com/r-dbi/adbi") · #source([ADBC R client], "https://arrow.apache.org/adbc/current/r/index.html")])
]

#slide(title: [SQLiteで試す])[
  #text(size: 0.70em, fill: muted, [準備：dbc install sqlite。adbi、adbcdrivermanager、DBI、dplyr、dbplyrを使用。])
  #v(0.22em)
  #code-panel(raw("con <- DBI::dbConnect(\n  adbi::adbi(adbcdrivermanager::adbc_driver(\"sqlite\")),\n  uri = \":memory:\"\n)\nDBI::dbWriteTable(con, \"mtcars\", mtcars)\ndplyr::tbl(con, \"mtcars\") |>\n  dplyr::filter(cyl == 6) |>\n  dplyr::summarise(n = dplyr::n(),\n                   avg_mpg = mean(mpg, na.rm = TRUE)) |>\n  dplyr::collect()\nDBI::dbDisconnect(con)", lang: "r", block: true))
  #v(0.28em)
  #text(size: 0.69em, fill: accent, [結果：n = 7、avg_mpg = 19.7])
  #sources([#source([ADBC Drivers], "https://arrow.apache.org/adbc/current/driver/index.html") · #source([adbi README], "https://github.com/r-dbi/adbi")])
]

#slide(title: [connection class = DBの種類、だった])[
  #grid(columns: (1fr, 1fr), column-gutter: 0.80em,
    [
      #text(size: 0.76em, fill: muted, [従来の自然な前提])
      #v(0.30em)
      #cell([RPostgresConnection]) #down() #cell([PostgreSQL dialect], color: warm)
    ],
    [
      #text(size: 0.76em, fill: accent, [genericな接続では])
      #v(0.30em)
      #cell([AdbiConnection]) #down() #cell([PostgreSQL / SQLite / Snowflake], color: warm)
    ],
  )
  #v(0.65em)
  #note([接続方法と接続先のSQL方言は、同じものではない。])
  #sources([#source([Posit: dbplyr 2.6.0], "https://opensource.posit.co/blog/2026-06-17_dbplyr-2-6-0/")])
]

#slide(title: [dbplyr 2.6.0でSQL方言を分離])[
  #align(center, cell([AdbiConnection]))
  #down()
  #align(center, cell([ADBC_INFO_VENDOR_NAME], sub: [driverにvendorを問い合わせる], color: warm))
  #down()
  #align(center, cell([sql_dialect()], sub: [PostgreSQL → dialect_postgres() など], color: accent))
  #v(0.45em)
  #text(size: 0.67em, fill: muted, [dbplyrのAdbiConnection backendはvendor名から方言を選ぶ。未認識vendorは汎用方言へ。])
  #sources([#source([dbplyr backend-adbc.R], "https://github.com/tidyverse/dbplyr/blob/main/R/backend-adbc.R") · #source([dbplyr sql-dialect.R], "https://github.com/tidyverse/dbplyr/blob/main/R/sql-dialect.R")])
]

#slide(title: [実行経路にはまだDBIがある])[
  #align(center, cell([dbplyr → DBI → adbi → ADBC], color: accent))
  #v(0.72em)
  #text(size: 0.77em, [adbiは既存のDBI ecosystemとADBCをつなぐ、役に立つ互換レイヤー。])
  #v(0.48em)
  #text(size: 0.77em, [ただ、dbplyrの実行backendとしてはADBCを直接選ぶ抽象化はまだない。])
  #v(0.50em)
  #note([DBIにもArrow APIがあり、adbiはdbGetQueryArrow()などを実装している。])
  #sources([#source([adbi README: Arrow API], "https://github.com/r-dbi/adbi") · #source([dbplyr 2.6.0], "https://opensource.posit.co/blog/2026-06-17_dbplyr-2-6-0/")])
]

#slide(title: [次に分けるとしたら？])[
  #grid(columns: (1fr, 1fr), column-gutter: 0.8em,
    [#cell([SQL dialect], sub: [SQLをどう書くか], color: accent)],
    [#cell([execution backend], sub: [DBI または ADBC], color: warm)],
  )
  #v(0.72em)
  #note([これは発表者の設計上の問題提起。dbplyrのロードマップではない。])
  #sources([#source([dbplyr 2.6.0], "https://opensource.posit.co/blog/2026-06-17_dbplyr-2-6-0/") · #source([ADBC FAQ], "https://arrow.apache.org/adbc/current/faq.html")])
]
