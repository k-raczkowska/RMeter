# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'
source('sqlQuery.R') #call database
source('calculateCorr.R')
#install.packages("corrplot")

library(devtools)
library(testthat)
library(RMySQL)

# jesli na bazie lokalnej jest haslo, to trzeba dodac parametr password
#mydb = RMySQL::dbConnect(RMySQL::MySQL(), user = 'root', password = '6759393',dbname = 'travistorrent', host = 'localhost')
#rs=RMySQL::dbSendQuery(mydb, "select count(*) from travistorrent_27_10_2016")
#data = DBI::dbFetch(rs, n=1)
#print(data)

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

# wyliczenie metryk z travistorrenta
M=calculateCorr(result)
