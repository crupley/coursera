
rankhospital <- function(state, outcome, rank){
    
    ## Read outcome data
    
    outcomes <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    ## Check that state and outcome are valid
    if (length(outcomes$State[outcomes$State==state])==0){
        stop("invalid state")
    }
    if (outcome != "heart attack" & outcome != "heart failure" & outcome != "pneumonia") {
        stop("invalid outcome")
    }
    if (outcome == "heart attack"){
        outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    } 
    if (outcome == "heart failure"){
        outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    } 
    if (outcome == "pneumonia"){
        outcome <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    } 
    
    ## Filter by state, sort by outcome and hospital name, return top element
    stateoutcomes <- outcomes[outcomes$State==state,]
    suppressWarnings(stateoutcomes[[outcome]] <- as.numeric(stateoutcomes[[outcome]]))
    stateoutcomes <- stateoutcomes[order(stateoutcomes[outcome], stateoutcomes["Hospital.Name"]), ]
    stateoutcomes <- stateoutcomes[!is.na(stateoutcomes[outcome]),]
    
    
    
    
}