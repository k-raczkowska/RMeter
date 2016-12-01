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
mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
rs=RMySQL::dbSendQuery(mydb, "select count(*) from travistorrent_27_10_2016")
data = DBI::dbFetch(rs, n=1)
print(data)
