
rankall <- function(outcome, rank = "best") {
    
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
    
    ## Filter by state, sort by outcome and hospital name, and rank
    
    #     stateoutcomes <- outcomes[outcomes$State==state,]
    #     suppressWarnings(stateoutcomes[[outcome]] <- as.numeric(stateoutcomes[[outcome]]))
    #     stateoutcomes <- stateoutcomes[order(stateoutcomes[outcome], stateoutcomes["Hospital.Name"]), ]
    #     stateoutcomes <- stateoutcomes[!is.na(stateoutcomes[outcome]),]
    #     stateoutcomes["Rank"] <- seq(dim(stateoutcomes)[1])
    #     
    
    #     
    #     
    #     stateoutcomes$Hospital.Name[stateoutcomes$Rank == rank]
    #         head(stateoutcomes[c(2,11,47)])
    
    #Sort and remove NAs
    outcomes <- outcomes[order(outcomes["State"], outcomes[outcome], outcomes["Hospital.Name"]), ]
    outcomes <- outcomes[!is.na(stateoutcomes[outcome]),]
    
    #Add Rankings
    
    
    if (rank == "best") rank <- 1
    if (rank == "worst") rank <- max(outcomes$Rank)
    if (rank > dim(outcomes)[1]) return (NA)
    
    target <- outcomes[outcomes$Rank == rank]
    

    
    
}