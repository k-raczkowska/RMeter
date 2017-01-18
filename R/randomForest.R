# Random Forest prediction of Kyphosis data
library(randomForest)
fit <- randomForest(tr_status ~ gh_team_size + gh_num_commit_comments + gh_src_churn +
                      gh_test_cases_per_kloc + gh_doc_files + gh_files_deleted,
                     data=resultCP)
print(fit) # view results 
importance(fit) # importance of each predictor