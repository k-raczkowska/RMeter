myapp <- httr::oauth_app("github", "eb0e2d954e3c072e0e05", "59e73934db0cc7e51363d7c3b59c6daa35629b2b")
github_token <- httr::oauth2.0_token(httr::oauth_endpoints("github"), myapp)
request1 <- httr::GET("https://api.github.com/repos/47deg/appsly-android-rest/commits?per_page=100", httr::config(token = github_token))
myjson <-  httr::content(request1)
myjson2 <- jsonlite::fromJSON(jsonlite::toJSON(myjson))

mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')

data = DBI::dbGetQuery(mydb, "select distinct gh_project_name from travistorrent_27_10_2016")
print(data)
c = nrow(data)
#myapp <- httr::oauth_app("github", "eb0e2d954e3c072e0e05", "59e73934db0cc7e51363d7c3b59c6daa35629b2b")
#github_token <- httr::oauth2.0_token(httr::oauth_endpoints("github"), myapp)
for(i in 1:c){
  insertIntoTable(data[i,1])
}

insertIntoTable <- function(project){
  mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
  commits = DBI::dbGetQuery(mydb, paste("select distinct git_commit from travistorrent_27_10_2016 where gh_project_name = '", project, "' ", sep = ""))
  additionalCommits = DBI::dbGetQuery(mydb, paste("select distinct git_commits from travistorrent_27_10_2016 where gh_project_name = '", project, "' ", sep = ""))
  len = nrow(commits)
  len2 = nrow(additionalCommits)
  print(len)
  for(i in 1:len){
    query = paste("https://api.github.com/repos/", project, "/commits/", commits[i,1], sep="")
    #req = httr::GET("https://api.github.com/rate_limit", httr::config(token = github_token))
    request1 <- httr::GET(query, httr::config(token = github_token))
    jsson <- httr::content(request1)
    jsson2 <- jsonlite::fromJSON(jsonlite::toJSON(jsson))
    mail = jsson2$commit$author$email
    if(!is.null(mail)){
      dbQuery = paste("INSERT INTO commits values ('", commits[i,1], "', null, '", mail, "')", sep = "")
      print(query)
      DBI::dbExecute(mydb, dbQuery)
    }
  }
  for(i in 1:len2){
    list = strsplit(additionalCommits[i,1], "#")[[1]]
    print(list)
  }
  RMySQL::dbDisconnect(mydb)
}

doInsert <- function(){
  mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
  DBI::dbExecute(mydb, "DROP TABLE IF EXISTS commits")
  #DBI::dbExecute(mydb, "DROP TABLE IF EXISTS files")
  DBI::dbExecute(mydb, "CREATE TABLE commits(sha text, committer_id integer, committer_email text)")
  #DBI::dbExecute(mydb, "CREATE TABLE files(filename text, status text, additions integer, deletions integer, changes integer, commit_sha text)")
  projects = DBI::dbGetQuery(mydb, "select distinct gh_project_name from travistorrent_27_10_2016")
  DBI::dbDisconnect(mydb)
  len = nrow(projects)
  for(i in 1:len){
    insertIntoTable(projects[i,1])
  }
  #lapply(dbListConnections( dbDriver( drv = "MySQL")), dbDisconnect)
}

#doInsert()
insertIntoTable("broadinstitute/picard")
insertIntoTable("HubSpot/Singularity")
insertIntoTable("google/bazel")
insertIntoTable("CyberAgent/android-gpuimage")
insertIntoTable("JakeWharton/u2020")
insertIntoTable("Berico-Technologies/CLAVIN")
insertIntoTable("L2J/L2J_Server")
insertIntoTable("igniterealtime/Openfire")
insertIntoTable("BaseXdb/basex")
insertIntoTable("47deg/appsly-android-rest")
insertIntoTable("bndtools/bnd")
