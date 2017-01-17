source('loadAllPackages.R')
source('sqlQuery.R') #call database
source('calculateCorr.R')



# Wywolanie funckji odpowiedzialnej za zapytanie do bazy
result = sqlQuery("select gh_project_name,gh_team_size,
                  gh_num_issue_comments, gh_num_commit_comments,gh_num_pr_comments,
                  
                  gh_test_churn, gh_src_churn,gh_files_added,
                  gh_files_deleted,gh_files_modified,gh_tests_added,gh_tests_deleted,
                  gh_src_files,
                  gh_doc_files, gh_other_files,

                  gh_sloc,gh_test_lines_per_kloc,gh_test_cases_per_kloc,
                  gh_asserts_cases_per_kloc,gh_description_complexity,gh_pull_req_num,
                  tr_duration, tr_setup_time,tr_tests_ok,tr_tests_fail, tr_tests_run,
                  tr_tests_skipped,
                  tr_ci_latency,tr_build_number,

                  tr_status  from travistorrent_27_10_2016 ")

# wyliczenie korelacji z travistorrenta
M=calculateCorr(result)

#transformacja danych na potrzeby 
resultCP <- result
resultCP[result=="errored"] <- "failed"
resultCP[result=="canceled"] <- "passed"
resultCP$tr_status <- factor(resultCP$tr_status)

source('rankFeaturesByImportance.R')
source('classificationTree.R')
source('regressionTree.R')
source('randomForest.R')




