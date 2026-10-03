library(dbplyr)

con <- DBI::dbConnect(
  adbi::adbi(adbcdrivermanager::adbc_driver("sqlite")),
  uri = ":memory:"
)
DBI::dbWriteTable(con, "mtcars", mtcars)

result <- dplyr::tbl(con, "mtcars") |>
  dplyr::filter(cyl == 6) |>
  dplyr::summarise(n = dplyr::n(), avg_mpg = mean(mpg, na.rm = TRUE)) |>
  dplyr::collect()

print(result)
DBI::dbDisconnect(con)
