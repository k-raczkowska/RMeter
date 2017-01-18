source('~/RMeter3/R/statusToValue.R')
source('~/RMeter3/R/replaceAllNA.R')


calculateCorr <- function(data.frame){
  
  
  data <-data.frame;
  df <- statusToValue(data);
  df <- replaceAllNA(df);


  # M1 = cor(df[,2],df[,15],method="spearman")
  # M2 = cor(df[,4], df[,15],method="spearman")
  # M3 = cor(df[,5], df[,15],method="spearman")
  # M4 = cor(df[,6], df[,15],method="spearman")
  # M5 = cor(df[,7], df[,15],method="spearman")
  # M6 = cor(df[,8], df[,15],method="spearman")
  # M7 = cor(df[,9], df[,15],method="spearman")
  # M8 = cor(df[,10], df[,15],method="spearman")
  # M9 = cor(df[,11], df[,15],method="spearman")
  # M10 = cor(df[,12], df[,15],method="spearman")
  # M11 = cor(df[,13], df[,15],method="spearman")
  # M12 = cor(df[,14], df[,15],method="spearman")
  # M3 = cor(df[,5], df[,15],method="spearman")
  # M4 = cor(df[,6], df[,15],method="spearman")
  # M5 = cor(df[,7], df[,15],method="spearman")
  # M6 = cor(df[,8], df[,15],method="spearman")
  # M7 = cor(df[,9], df[,15],method="spearman")
  # M8 = cor(df[,10], df[,15],method="spearman")
  # M9 = cor(df[,11], df[,15],method="spearman")
  # M10 = cor(df[,12], df[,15],method="spearman")
  # M11 = cor(df[,13], df[,15],method="spearman")
  # M12 = cor(df[,14], df[,15],method="spearman")
  

  
  M=cor(df[,2:30])
 # col<- colorRampPalette(c("blue", "white", "red"))(20)
 # heatmap(x = M, col = col, symm = TRUE)
  #corrplot(M, type = "upper", order = "hclust", 
                    #tl.col = "black", tl.srt = 45)
  #corrplot(M, method = "circle")
  
  # 
  # cells <-c(M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12)
  # rnames <- c("1")
  # cnames <- c("team size", "test churn", "src churn","files added","files deleted",
  #             "tests added","tests deleted","files modified",
  #             "src files","sloc","test lines per kloc",
  #             "test cases per kloc"
  #             )
  # corrMatrix <- matrix(cells, nrow=1, ncol=12, byrow=TRUE,
  #                    dimnames=list(rnames, cnames))

  return (M)
}
