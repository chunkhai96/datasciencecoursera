pollutantmean <- function(directory, pollutant, id=1:332) {
  df_merge <- data.frame()
  for(i in id) {
    filename <- paste(formatC(i, width=3, flag="0"), "csv", sep=".")
    df <- read.csv(paste(directory, filename, sep="/"))
    df_merge <- rbind.data.frame(df_merge, df)
  }
  mean(df_merge[[pollutant]], na.rm = TRUE)
}
