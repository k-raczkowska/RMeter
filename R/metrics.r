longestChain <- function(lastBuildNo, project, status){
  mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
  data = DBI::dbGetQuery(mydb, paste("select distinct tr_build_id, tr_status from travistorrent_27_10_2016 
                                     where tr_build_number >= ", lastBuildNo, " and gh_project_name = '", project, "' order by tr_build_id", sep=""))
  
  
  DBI::dbDisconnect(mydb)
  return(data)
}

longestChainCommitter <- function(lastBuildNo, project, status){
  mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
  commit = DBI::dbGetQuery(mydb, paste("select distinct git_commit from travistorrent_27_10_2016 where tr_build_id >=", lastBuildNo, sep = ""))
  data = DBI::dbGetQuery(mydb, paste("select distinct tr_build_id, tr_status from travistorrent_27_10_2016 t
                                     where tr_build_number >= ", lastBuildNo, " and gh_project_name = '", project, 
                                     "' and git_commit in (select git_commit from commits where committer_id = (select committer_id from commits where sha = ",
                                     " (select distinct git_commit from travistorrent_27_10_2016 where tr_build_id >=", lastBuildNo,
                                     "))) order by tr_build_id", sep=""))
  return(data)
}

#select id from table where committer = (select committer from table where id = :id)
#select git_commit from travistorrent where git_commit in (select id from )

longestChainArray <- function(data, status){
  c = nrow(data)
  #print(c)
  count = 0
  max = 0
  for(i in 1:c){
    if(data[i,2] == status){
      count = count + 1
    }
    else
      count = 0
    if(count > max){
      max = count
    }
  }
  #print(max)
  return(max)
}

shortestChain <- function(lastBuildNo, project, status){
  mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
  data = DBI::dbGetQuery(mydb, paste("select distinct tr_build_id, tr_status from travistorrent_27_10_2016 
                                     where tr_build_number >= ", lastBuildNo, " and gh_project_name = '", project, "' order by tr_build_id", sep=""))
  
  
  DBI::dbDisconnect(mydb)
  return(data)
}

shortestChainArray <- function(data, status){
  c = nrow(data)
  count = 0
  min = c+1
  for(i in 1:c){
    if(data[i,2] == status){
      count = count + 1
    }
    else{
      if((count < min && count != 0)){
        min = count
      }
      count = 0
    }
  }
  
  if(min == c+1){
    min = count
  }
  return(min)
}

averageChain <- function(lastBuildNo, project, status){
  mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
  data = DBI::dbGetQuery(mydb, paste("select distinct tr_build_id, tr_status from travistorrent_27_10_2016 
                                     where tr_build_number >= ", lastBuildNo, " and gh_project_name = '", project, "' order by tr_build_id", sep=""))
  
  
  DBI::dbDisconnect(mydb)
  return(data)
}

averageChainArray <- function(data, status){
  c = nrow(data)
  count = 0
  average = 0
  elems = 0
  lista <- list()
  sum = 0
  for(i in 1:c){
    if(data[i,2] == status){
      count = count + 1
    }
    else{
      lista[elems] <- count
      sum = sum + count
      elems = elems + 1
      count = 0
    }
  }
  print(sum)
  print(length(lista))
  xx = sum / length(lista)
  print(xx)
  #print(lista)
  return(lista)
}

coefficient <- function(lastBuildNo, project, status){
  mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
  data = DBI::dbGetQuery(mydb, paste("select distinct tr_build_id, tr_status from travistorrent_27_10_2016 
                                     where tr_build_number >= ", lastBuildNo, " and gh_project_name = '", project, "' order by tr_build_id", sep=""))
  
  
  DBI::dbDisconnect(mydb)
  c = nrow(data)
  passed = 0
  failed = 0
  errored = 0
  cancelled = 0
  for(i in 1:c){
    if(data[i,2] == 'passed'){
      passed = passed + 1
    }
    else if(data[i,2] == 'errored'){
      errored = errored + 1
    }
    else if(data[i,2] == 'failed'){
      failed = failed + 1
    }
    else{
      cancelled = cancelled + 1
    }
  }
  result <- passed / (errored + failed + passed)
  print(result)
  print(passed / (c))
  print(cancelled)
  return(result)
}

timeFromLastBuild <- function(lastBuildNo, project, status){
  mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = 'master', dbname = 'travistorrent', host = 'localhost')
  data = DBI::dbGetQuery(mydb, paste("select tr_started_at from travistorrent_27_10_2016 where gh_project_name = '", project, "' and tr_status = '", status, "' and tr_build_number >= ", lastBuildNo, " order by tr_started_at limit 1", sep = ""))
  DBI::dbDisconnect(mydb)
  x = difftime(Sys.Date(), strptime(data, format = "%Y-%m-%d"), units = "days")
  y = as.numeric(x, units="days")
  print(data)
  print(x)
  print(y)
  return(y)
}

timeFromLastCommitterBuild <- function(lastBuildNo, project, status, committer){
  
}

x = longestChainArray(longestChain(911, "HubSpot/Singularity", 'passed'), 'passed')
y = shortestChainArray(shortestChain(911, "HubSpot/Singularity", 'passed'), 'passed')
z = averageChainArray(averageChain(911, "HubSpot/Singularity", 'passed'), 'passed')

d = longestChain(911, "HubSpot/Singularity", 'passed')
e = longestChain(911, "HubSpot/Singularity", 'errored')
f = longestChain(911, "HubSpot/Singularity", 'failed')

g = shortestChain(911, "HubSpot/Singularity", 'passed')
h = shortestChain(911, "HubSpot/Singularity", 'errored')
i = shortestChain(911, "HubSpot/Singularity", 'failed')

j = averageChain(911, "HubSpot/Singularity", 'passed') 
m = averageChain(911, "HubSpot/Singularity", 'errored') 
n = averageChain(911, "HubSpot/Singularity", 'failed') 

o = coefficient(911, "HubSpot/Singularity", 'failed')

p = timeFromLastBuild(911, "HubSpot/Singularity", 'passed')

q = longestChainCommitter(911, "HubSpot/Singularity", 'passed')
