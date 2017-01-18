statusToValue <- function(data.frame){


  df<- data.frame
  result <- data.frame(df$gh_project_name,df$gh_team_size,df$gh_num_issue_comments,
                       df$gh_num_commit_comments,df$gh_num_pr_comments,
                       df$gh_test_churn,df$gh_src_churn,df$gh_files_added,
                       df$gh_files_deleted,df$gh_files_modified,df$gh_tests_added,
                       df$gh_tests_deleted,df$gh_src_files,df$gh_doc_files,
                       df$gh_other_files,df$gh_sloc,df$gh_test_lines_per_kloc,
                       df$gh_test_cases_per_kloc,df$gh_asserts_cases_per_kloc,
                       df$gh_description_complexity,df$gh_pull_req_num,
                       df$tr_duration, df$tr_setup_time,df$tr_tests_ok,
                       df$tr_tests_fail,df$tr_tests_run,df$tr_tests_skipped, 
                       df$tr_ci_latency,df$tr_build_number,
                       sapply(df$tr_status,
                                                  switch,'errored'= 0,
                                                  'failed'= 0,'passed'= 1,
                                                  'canceled'=1))

  names(result) <- c("Project_name", "Team_size","Num issue comments","Num commit comments",
                     "Num pr comments","Test churn","Src churn","Files added","Files deleted " ,
                     "Files modified","tests added","tests deleted", " src files","doc files",
                     "other files","sloc","test lines per kloc","test cases per kloc",
                     "asserts cases per kloc","description complexity","pull req num",
                     "tr_duration","tr_setup_time","tr_tests_ok","tr_tests_fail",
                     "tr_tests_run","tr_tests_skipped","tr_ci_latency",
                     "Build number","Status")

   return(result)
}
