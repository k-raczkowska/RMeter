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

printing <- function() {
  print("Hello, world!")
}
printing()
install.packages("RMySQL")
install.packages("testthat")
install.packages("devtools")
library(RMySQL)
mydb = dbConnect(MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
rs=dbSendQuery(mydb, "select count(*) from travistorrent_27_10_2016")
data = fetch(rs, n=1)
print(data)
