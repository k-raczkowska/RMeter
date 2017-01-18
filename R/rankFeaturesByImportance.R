#Rank features by importance
# lvq -  Learning Vector Quantization (LVQ) model
# varImp -used to estimate the variable importance 

# ensure results are repeatable
set.seed(7)




# prepare training scheme
control <- trainControl(method="repeatedcv", number=10, repeats=3)
# train the model
model1 <- train(tr_status~ gh_num_pr_comments + gh_num_issue_comments + gh_pull_req_num
                + gh_sloc + 
                 gh_files_added + gh_files_deleted , data=resultCP, method="lvq", 
                preProcess="scale", 
               trControl=control)

model2 <- train(tr_status~ gh_team_size + gh_num_commit_comments + gh_test_churn + 
                  gh_src_churn + 
                  gh_files_modified + gh_tests_added , data=resultCP, method="lvq",
                preProcess="scale", 
                trControl=control)

model3 <- train(tr_status~ gh_tests_deleted + gh_src_files + gh_doc_files + gh_other_files + 
                  gh_test_lines_per_kloc + gh_test_cases_per_kloc + gh_description_complexity, 
                  data=resultCP, method="lvq", preProcess="scale", trControl=control)

# estimate variable importance
importance <- varImp(model, scale=FALSE)
# summarize importance
print(importance)
# plot importance
plot(importance)