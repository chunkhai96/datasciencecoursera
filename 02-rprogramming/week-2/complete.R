complete <- function(directory, id=1:332) {
  nobs <- c()
  for(i in id) {
    filename <- paste(formatC(i, width=3, flag="0"), "csv", sep=".")
    df <- read.csv(paste(directory, filename, sep="/"))
    nobs <- c(nobs, nrow(df[complete.cases(df),]))
  }
  data.frame(id, nobs)
}