#calculate classification model for features:
# gh_team_size, gh_num_commit_comments, gh_src_churn, gh_test_cases_per_kloc,
# gh_doc_files,  gh_files_deleted 
# Classification Tree with rpart
library(rpart)

# grow tree 
fit <- rpart(tr_status ~ gh_team_size + gh_num_commit_comments + gh_src_churn +
               gh_test_cases_per_kloc + gh_doc_files + gh_files_deleted,
             method="class", data=resultCP)

printcp(fit) # display the results 
plotcp(fit) # visualize cross-validation results 
summary(fit) # detailed summary of splits

# plot tree 
plot(fit, uniform=TRUE, 
     main="Classification Tree for Kyphosis")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

# create attractive postscript plot of tree 
post(fit, file = "c:/tree.ps", 
     title = "Classification Tree for Kyphosis")