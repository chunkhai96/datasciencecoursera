rankall <- function(outcome, num = "best") {
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  splitOutcome <- strsplit(outcome, " ")
  outcome <- "Hospital.30.Day.Death..Mortality..Rates.from"
  for(i in splitOutcome[[1]]){
    outcome <- paste(outcome, tools::toTitleCase(i), sep=".")
  }
  if(! outcome %in% colnames(df)){
    stop(" invalid outcome")
  }
  
  dfFin <- NULL
  for(state in sort(unique(df$State))){
    sub <- df[df$State == state, ]
    sub <- sub[sub[outcome] != "Not Available",]
    sub[outcome] <- as.numeric(sub[[outcome]])
    sub <- sub[order(sub[outcome], sub$Hospital.Name),]
    
    if(num == "best") num = 1
    else if(num == "worst") num = nrow(sub)
    
    sub <- sub[num,]
    if(is.na(sub[outcome])){
      sub$State = state
    }
    
    if(is.null(dfFin)){
      dfFin = sub[c("Hospital.Name", "State")]
    }
    else{
      dfFin <- rbind(dfFin, sub[c("Hospital.Name", "State")])
    }
    print(paste(sub$Hospital.Name, sub$State), sep="-----")
  }
  
  colnames(dfFin) <- c("hospital", "state")
  dfFin
}