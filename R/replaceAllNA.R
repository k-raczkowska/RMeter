replaceAllNA <- function(data.frame){
  result <-data.frame;
  result[is.na(result)] <- 0;
  
return(result)
  }