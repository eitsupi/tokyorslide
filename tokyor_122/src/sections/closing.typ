#import "../theme.typ": *
#import "../components.typ": *
#import "../slide-components.typ": *
#import "@preview/touying:0.7.4": *

#section-title([], [Rでの活用例], subtitle: [既存の道具にADBCが入ってきた])

#slide(title: [Positの2つの例])[
  #text(size: 0.84em, weight: "bold", fill: accent, [ggsql 0.5.0])
  #v(0.14em)
  #text(size: 0.76em, [generic database readerとしてADBCを追加。ODBCとも並んで使える。])
  #v(0.63em)
  #text(size: 0.84em, weight: "bold", fill: accent, [skiLift])
  #v(0.14em)
  #text(size: 0.76em, [通常はSnowflake SQL API（HTTPS / JSON）。大量データの転送時は、利用可能ならADBC / Arrowを使用。])
  #v(0.60em)
  #note([上位のR APIと、下で使う接続・転送方式は別々に選べる。])
  #sources([#source([Posit: ggsql 0.5.0], "https://opensource.posit.co/blog/2026-09-24_ggsql_0_5_0/") · #source([Posit: skiLift], "https://posit.co/blog/r-meet-snowflake-introducing-posits-skilift-and-skipatrol-packages/")])
]

#slide(title: [まとめ])[
  #label([Arrow], [データ表現のN×M問題に共通形式を用意した])
  #v(0.42em)
  #label([ADBC], [接続のN×M問題にArrow-nativeな共通API])
  #v(0.42em)
  #label([この1年], [driver配布、dbt v2、Rでの利用が前進した])
  #v(0.42em)
  #label([Rでは], [接続方法・SQL方言・実行層を分けて考えるきっかけに])
  #sources([#source([Arrow Overview], "https://arrow.apache.org/overview/") · #source([ADBC FAQ], "https://arrow.apache.org/adbc/current/faq.html") · #source([dbplyr 2.6.0], "https://opensource.posit.co/blog/2026-06-17_dbplyr-2-6-0/")])
]
