best <- function(state, outcome) {
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  df <- df[complete.cases(df),]
  sub <- df[df$State == state, ]
  splitOutcome <- strsplit(outcome, " ")
  outcome <- "Hospital.30.Day.Death..Mortality..Rates.from"
  for(i in splitOutcome[[1]]){
    outcome <- paste(outcome, tools::toTitleCase(i), sep=".")
  }
  if(nrow(sub) == 0){
    stop("invalid state")
  }
  else if(! outcome %in% colnames(sub)){
    stop(" invalid outcome")
  }
  sub <- sub[sub[outcome] != "Not Available",]
  sub[which.min(sub[[outcome]]),]$Hospital.Name
}