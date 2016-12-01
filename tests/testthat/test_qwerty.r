testthat::test_that("Otwieranie połączenia do bazy danych", {
  mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', dbname = 'travistorrent', host = 'localhost')
  testthat::expect_true(inherits(mydb, "MySQLConnection"))
})

testthat::test_that("Add", {
  expect_equal(2+2, 4)
})
