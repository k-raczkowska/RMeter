test_that("Otwieranie połączenia do bazy danych", {
  mydb = RMySQL::dbConnect(MySQL(), user = 'root', dbname = 'travistorrent', host = 'localhost')
  expect_true(RMySQL::inherits(mydb, "MySQLConnection"))
})

test_that("Add", {
  expect_equal(2+2, 4)
})
