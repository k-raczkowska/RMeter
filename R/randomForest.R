# Random Forest prediction of Kyphosis data
load("~/RMeter3/first.rda")
resultCP <- result
resultCP[result=="errored"] <- "failed"
resultCP[result=="canceled"] <- "passed"
resultCP$tr_status <- factor(resultCP$tr_status)
fit <- randomForest::randomForest(tr_status ~ gh_team_size + gh_num_commit_comments + gh_src_churn +
                      gh_test_cases_per_kloc + gh_doc_files + gh_files_deleted,
                     data=resultCP);
#print(fit); # view results 
#importance(fit); # importance of each predictor

preds <- stats::predict(fit, resultCP);
matrix <- confusionMatrix(preds,resultCP$tr_status);
tofile <- data.frame(cbind(t(matrix$overall),t(matrix$byClass)));
write.table(tofile,file="MacierzeKorelacji/ConfMatrixRandomForest.txt",sep='\t');

returnAccuracyRandFor <- function(){
  
  overall <- matrix$overall
  overall.accuracy <- overall['Accuracy']
  
  return(overall.accuracy)
}