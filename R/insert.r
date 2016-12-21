myapp <- httr::oauth_app("github", "eb0e2d954e3c072e0e05", "59e73934db0cc7e51363d7c3b59c6daa35629b2b")
github_token <- httr::oauth2.0_token(httr::oauth_endpoints("github"), myapp)
request1 <- httr::GET("https://api.github.com/repos/47deg/appsly-android-rest/commits?per_page=100", httr::config(token = github_token))
myjson <-  httr::content(request1)
myjson2 <- jsonlite::fromJSON(jsonlite::toJSON(myjson))

mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
DBI::dbExecute(mydb, "DROP TABLE IF EXISTS commits")
DBI::dbExecute(mydb, "CREATE TABLE commits(sha text, committer_id integer, committer_email text)")
#DBI::dbExecute(mydb, "INSERT INTO commits (sha, committer_id) values ('1', 1)")
data = DBI::dbGetQuery(mydb, "select distinct gh_project_name from travistorrent_27_10_2016")
print(data)
c = nrow(data)
myapp <- httr::oauth_app("github", "eb0e2d954e3c072e0e05", "59e73934db0cc7e51363d7c3b59c6daa35629b2b")
github_token <- httr::oauth2.0_token(httr::oauth_endpoints("github"), myapp)
for(i in 1:c){
  insertIntoTable(data[i,1])
  #print(data[i,1])
  #x = data[i,1]
  #print(x)
  #stri = paste("select git_commit from travistorrent_27_10_2016 where gh_project_name = '",x,"'", sep = "")
  #commits = DBI::dbGetQuery(mydb, stri)
  #print(stri)
  #print(nrow(commits))
  #request1 <- httr::GET(paste("https://api.github.com/repos/", x, "/commits?per_page=100", sep=""), httr::config(token = github_token))
  #jsson <- httr::content(request1)
  #jsson2 <- jsonlite::fromJSON(jsonlite::toJSON(jsson))
  #View(jsson2)
  #d = nrow(jsson2)
  #stri = paste("INSERT INTO commits (sha, committer_id) values ('", jsson2$sha, "',", jsson2$committer$id, ")", sep = "")
  #print(stri)
}

insertIntoTable <- function(project){
  mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
  commits = DBI::dbGetQuery(mydb, paste("select distinct git_commit from travistorrent_27_10_2016 where gh_project_name = '", project, "' ", sep = ""))
  len = nrow(commits)
  print(len)
  for(i in 1:len){
    query = paste("https://api.github.com/repos/", project, "/commits/", commits[i,1], sep="")
    #print(query)
    req = httr::GET("https://api.github.com/rate_limit", httr::config(token = github_token))
    #print(req)
    request1 <- httr::GET(query, httr::config(token = github_token))
    jsson <- httr::content(request1)
    jsson2 <- jsonlite::fromJSON(jsonlite::toJSON(jsson))
    committer = jsson2$committer$id
    mail = jsson2$commit$author$email
    if(!is.null(committer)){
      dbQuery = paste("INSERT INTO commits values ('", commits[i,1], "', null, '", mail, "')", sep = "")
      print(dbQuery)
      #DBI::dbExecute(mydb, dbQuery)
    }
    #DBI::dbDisconnect(mydb)
    #DBI::dbExecute(mydb, )
    #View(jsson2)
  }
  #print(nrow(commits))
}

insertIntoTable("broadinstitute/picard")
insertIntoTable("HubSpot/Singularity")
