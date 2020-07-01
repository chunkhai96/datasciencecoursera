corr <- function(directory, threshold = 0) {
  correlation <- c()
  for(i in 1:332) {
    filename <- paste(formatC(i, width=3, flag="0"), "csv", sep=".")
    df <- read.csv(paste(directory, filename, sep="/"))
    df <- df[complete.cases(df),]
    if(nrow(df) > threshold) {
      correlation <- c(correlation, cor(df[['sulfate']], df[['nitrate']]))
    }
  }
  
  correlation
}