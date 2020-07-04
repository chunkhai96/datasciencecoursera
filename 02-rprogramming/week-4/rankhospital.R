rankhospital <- function(state, outcome, num = "best") {
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
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
  sub[outcome] <- as.numeric(sub[[outcome]])
  sub <- sub[order(sub[outcome], sub$Hospital.Name),]
  if(num == "best") num = 1
  else if(num == "worst") num = nrow(sub)
  sub[num,]$Hospital.Name
}
