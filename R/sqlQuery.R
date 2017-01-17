
#Call to database and kill connection
sqlQuery <- function (query){
  # creating DB connection object with RMysql package
  DB <- RMySQL::dbConnect(MySQL(), user="root", password='6759393', dbname='travistorrent', host='localhost')

  # send Query to btain result set
  rs <- RMySQL::dbSendQuery(DB, query)

  # get elements from result sets and convert to dataframe
  result <- fetch(rs, -1)

  # close db connection
  dbDisconnect(DB)

  # return the dataframe
  return(result)
}
