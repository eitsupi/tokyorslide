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

json_data <- duckplyr::read_csv_duckdb("out.csv") |>
  duckplyr::as_tbl() |>
  dplyr::mutate(
    date = dplyr::sql(
      "regexp_extract(filename, '[0-9]{4}-[0-9]{2}-[0-9]{2}')"
    ) |>
      as.Date()
  ) |>
  duckplyr::as_duckdb_tibble() |>
  dplyr::select(!filename) |>
  dplyr::group_by(date, flavor) |>
  tidyr::fill(tidyselect::everything()) |>
  dplyr::ungroup()

rust_versions <- gert::git_remote_ls("https://github.com/rust-lang/rust") |>
  dplyr::select(ref) |>
  dplyr::filter(grepl("^refs/tags/", ref)) |>
  dplyr::mutate(
    ref = gsub("^refs/tags/", "", ref) |>
      smvr::parse_semver() |>
      suppressWarnings()
  ) |>
  dplyr::filter(!is.na(ref)) |>
  dplyr::pull(ref) |>
  sort() |>
  as.character() |>
  as.factor()

json_data |>
  dplyr::filter() |>
  dplyr::mutate(
    version = factor(rustc, levels = rust_versions)
  ) |>
  dplyr::select(date, flavor, version) |>
  ggplot2::ggplot(
    ggplot2::aes(x = date, y = version, group = flavor, color = flavor)
  ) +
  ggplot2::geom_step() +
  ggplot2::scale_y_discrete(
    limits = rust_versions[smvr::as_smvr(as.character(rust_versions)) >= "1.70.0"]
  )
