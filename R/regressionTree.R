# Regression Tree Example
load("~/RMeter3/first.rda")

resultCP <- result
resultCP[result=="errored"] <- "failed"
resultCP[result=="canceled"] <- "passed"
resultCP$tr_status <- factor(resultCP$tr_status)
# grow tree 
fit <- rpart::rpart(tr_status ~ gh_team_size + gh_num_commit_comments + gh_src_churn +
               gh_test_cases_per_kloc + gh_doc_files + gh_files_deleted,
             method="anova", data=resultCP);

#rpart::printcp(fit); # display the results 
#rpart::plotcp(fit); # visualize cross-validation results 
#summary(fit); # detailed summary of splits

# create additional plots 
#par(mfrow=c(1,2)); # two plots on one page 
#rpart::rsq.rpart(fit); # visualize cross-validation results  	

# plot tree 
png(filename="~/RMeter3/R/Wykresy/RegressionTree.png");
plot(fit, uniform=TRUE, 
     main="Regression Tree for Build status ");
text(fit, use.n=TRUE, all=TRUE, cex=.8);
dev.off();

# create attractive postcript plot of tree 
post(fit, file = "~/RMeter3/R/Dane/RegressionTree.ps", 
     title = "Regression Tree for Build status ");
# prune the tree 
pfit<- rpart::prune(fit, cp=0.01160389); # from cptable   

# plot the pruned tree 
png(filename="~/RMeter3/R/Wykresy/RegressionPrunedTree.png");
plot(pfit, uniform=TRUE, 
     main="Pruned Regression Tree for Build status");
text(pfit, use.n=TRUE, all=TRUE, cex=.8)
dev.off();
rpart::post(pfit, file = "~/RMeter3/R/Dane/RegressionPrunedTree.ps", 
     title = "Pruned Regression Tree for Build status");

#preds <- stats::predict(pfit, resultCP);
#matrix <- confusionMatrix(factor(preds[,2]), factor(as.numeric(resultCP$tr_status)));
#tofile <- data.frame(cbind(t(matrix$overall),t(matrix$byClass)));
#write.table(tofile,file="MacierzeKorelacji/ConfMatrixPrunedRegTree.txt",sep='\t');

#returnAccuracyReg <- function(){
  
 # overall <- matrix$overall
#  overall.accuracy <- overall['Accuracy']
  
#  return(overall.accuracy)
#}