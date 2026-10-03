#import "../theme.typ": *
#import "../components.typ": *
#import "../slide-components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([], [Rでの活用例])

#slide(title: [Posit社の2つの例])[
  #text(size: 0.84em, weight: "bold", fill: accent, [ggsql 0.5.0])
  #v(0.14em)
  #text(size: 0.85em, [汎用のデータベース読み込み手段としてADBCを追加。ODBCとも並んで使える。])
  #v(0.63em)
  #text(size: 0.84em, weight: "bold", fill: accent, [skiLift])
  #v(0.14em)
  #text(size: 0.85em, [通常はSnowflake SQL API（HTTPS / JSON）。大量データの転送時は、利用可能ならADBC / Apache Arrowを使用。])
  #v(0.60em)
  #note([上位のR APIと、下で使う接続・転送方式は別々に選べる。])
  #sources([#source([Posit社: ggsql 0.5.0], "https://opensource.posit.co/blog/2026-09-24_ggsql_0_5_0/") · #source([Posit社: skiLift], "https://posit.co/blog/r-meet-snowflake-introducing-posits-skilift-and-skipatrol-packages/")])
]

#slide(title: [まとめ])[
  #label([Apache Arrow], [データ表現のN×M問題に共通形式を用意した])
  #v(0.42em)
  #label([ADBC], [接続のN×M問題にApache Arrowを受け渡す共通API])
  #v(0.42em)
  #label([この1年], [ドライバー配布とdbt v2採用。#linebreak()念願のdbplyrからの利用が可能に])
  #v(1.1em)
  #align(right, text(size: 1.8em, weight: "bold", [Enjoy!]))
  #sources([#source([Apache Arrow Overview], "https://arrow.apache.org/overview/") · #source([ADBC FAQ], "https://arrow.apache.org/adbc/current/faq.html") · #source([ADBC Drivers], "https://arrow.apache.org/adbc/current/driver/index.html") · #source([dbt v2], "https://docs.getdbt.com/docs/dbt/adbc") · #source([dbplyr 2.6.0], "https://opensource.posit.co/blog/2026-06-17_dbplyr-2-6-0/")])
]
