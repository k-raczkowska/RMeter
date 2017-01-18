#calculate classification model for features:
# gh_team_size, gh_num_commit_comments, gh_src_churn, gh_test_cases_per_kloc,
# gh_doc_files,  gh_files_deleted 
# Classification Tree with rpart
# Very important comment


# grow tree 
load("~/RMeter3/first.rda")
resultCP <- result
resultCP[result=="errored"] <- "failed"
resultCP[result=="canceled"] <- "passed"
resultCP$tr_status <- factor(resultCP$tr_status)
fit <- rpart::rpart(tr_status ~ gh_team_size + gh_num_commit_comments + gh_src_churn +
               gh_test_cases_per_kloc + gh_doc_files + gh_files_deleted,
             method="class", data=resultCP);

#rpart::printcp(fit); # display the results 
#rpart::plotcp(fit); # visualize cross-validation results 
#summary(fit); # detailed summary of splits

# plot tree 
#png(filename="Wykresy/ClassificationTree.png");
plot(fit, uniform=TRUE, 
     main="Classification Tree for build status");
text(fit, use.n=TRUE, all=TRUE, cex=.8);
#dev.off();
#dev.off();
# create attractive postscript plot of tree 
rpart::post(fit, file = "Dane/ClassificationTree.ps", 
     title = "Classification Tree for build status");

# prune the tree 
pfit<- rpart::prune(fit, cp=   fit$cptable[which.min(fit$cptable[,"xerror"]),"CP"]);

# plot the pruned tree 
png(filename="Wykresy/ClassificationPrunedTree.png");
plot(pfit, uniform=TRUE, 
     main="Pruned Classification Tree for build status");
text(pfit, use.n=TRUE, all=TRUE, cex=.8);
dev.off();

post(pfit, file = "Dane/ClassificationPrunedTree.ps", 
     title = "Pruned Classification Tree build status");


preds <- stats::predict(pfit, resultCP, type = "class");
matrix <- confusionMatrix(preds,resultCP$tr_status);
tofile <- data.frame(cbind(t(matrix$overall),t(matrix$byClass)));
write.table(tofile,file="MacierzeKorelacji/ConfMatrixPrunedClassTree.txt",sep='\t');

returnAccuracyClass <- function(){
  
  overall <- matrix$overall;
  overall.accuracy <- overall['Accuracy'];

  return(overall.accuracy)
}
