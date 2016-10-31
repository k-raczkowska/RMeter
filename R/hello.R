# Hello, world!
#
# This is an example function named 'hello2'
# which prints 'Hello, world!'.
#
# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

hello2 <- function() {
  print("Hello, world!")
}
#hello
hello2()
install.packages("RMySQL")
install.packages("testthat")
install.packages("devtools")
library(RMySQL)
#mydb = dbConnect(MySQL(), user = 'root', password = 'master', host = 'localhost')
mydb = dbConnect(MySQL(), user = 'root', dbname = 'travistorrent', host = 'localhost')
#mydb = dbConnect(MySQL(), user='root', dbname='baza', password='', host='localhost')
#rs=dbSendQuery(mydb, "select * from travistorrent limit 1")
#data = fetch(rs, n=1)
#print(data)
