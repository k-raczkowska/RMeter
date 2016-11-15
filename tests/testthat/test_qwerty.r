library(testthat)
install.packages('RMySQL', repos='http://cran.us.r-project.org')


#test_that("Otwieranie i zamykanie połączenia do bazy danych", {
#  mydb = dbConnect(MySQL(), user = 'root', dbname = 'travistorrent', host = 'localhost')
#  expect_true(inherits(mydb, "MySQLConnection"))
#})

test_that("Add", {
  expect_equal(2+2, 4)
})

ip <- as.data.frame(installed.packages()[,c(1,3:4)])
rownames(ip) <- NULL
ip <- ip[is.na(ip$Priority),1:2,drop=FALSE]
print(ip, row.names=FALSE)

test_that("Try", {
  expect_equal(ip$Package, RMySQL)
})
