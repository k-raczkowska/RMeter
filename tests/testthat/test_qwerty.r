library(testthat)

test_that("Otwieranie i zamykanie połączenia do bazy danych", {
  mydb = dbConnect(MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
  expect_true(inherits(mydb, "MySQLConnection"))
})
