# Tokyo.R #122

2026-10-03「ADBC最前線？」

日本語表示には Noto Sans CJK JP を使用します。

```sh
typst compile --root . tokyor_122/src/main.typ tokyor_122/tokyor_122.pdf
```

RのSQLite例を試す場合は、adbi、adbcdrivermanager、DBI、dplyr、dbplyr をインストールし、`dbc install sqlite` でdriverを導入した上で実行します。

```sh
Rscript tokyor_122/example.R
```
