library(testthat)
install.packages(RMySQL, repos='http://cran.us.r-project.org')
library(RMySQL)


#test_that("Otwieranie i zamykanie połączenia do bazy danych", {
#  mydb = dbConnect(MySQL(), user = 'root', dbname = 'travistorrent', host = 'localhost')
#  expect_true(inherits(mydb, "MySQLConnection"))
#})

test_that("Add", {
  expect_equal(2+2, 4)
})
