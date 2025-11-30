# すべてのGitタグからJSONファイルのURLを生成
json_urls <- gert::git_remote_ls(
  remote = "https://github.com/eitsupi/cran-rust-version.git"
) |>
  duckplyr::as_duckdb_tibble() |>
  dplyr::filter(
    grepl("^refs/tags/", ref)
  ) |>
  dplyr::mutate(
    url = paste0(
      "https://raw.githubusercontent.com/eitsupi/cran-rust-version/",
      ref,
      "/output/versions.json"
    ),
    .keep = "none"
  ) |>
  dplyr::pull(url)

# すべてのJSONファイルを読み込んだ結果を保存
duckplyr::read_json_duckdb(json_urls, options = list(filename = TRUE)) |>
  duckplyr::compute_csv("out.csv")

df_wider <- duckplyr::read_csv_duckdb("out.csv") |>
  duckplyr::as_tbl() |>
  dplyr::mutate(
    date = dplyr::sql(
      "regexp_extract(filename, '[0-9]{4}-[0-9]{2}-[0-9]{2}')"
    ) |>
      as.Date()
  ) |>
  dplyr::select(!filename) |>
  tidyr::pivot_wider(
    names_from = flavor,
    values_from = rustc
  ) |>
  dplyr::collect()

all_dates <- seq(
  from = min(df_wider$date),
  to = max(df_wider$date),
  by = "day"
)

df_wider |>
  dplyr::right_join(
    duckplyr::duckdb_tibble(date = all_dates),
    by = "date"
  ) |>
  dplyr::collect() |>
  # Maybe bug of dbplyr or duckplyr. fill does not work
  # duckplyr::as_tbl() |>
  # dbplyr::window_order(date) |>
  dplyr::arrange(date) |>
  tidyr::fill(tidyselect::everything())
