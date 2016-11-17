library(testthat)
library(devtools, lib.loc = '/home/travis/R/Library/RMySQL/libs')
library(RMySQL)
#install.packages("RMySQL", repos='http://cran.us.r-project.org')

test_that("Otwieranie połączenia do bazy danych", {
  mydb = dbConnect(MySQL(), user = 'root', dbname = 'travistorrent', host = 'localhost')
  expect_true(inherits(mydb, "MySQLConnection"))
})

test_that("Add", {
  expect_equal(2+2, 4)
})
