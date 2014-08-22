#complete.R
#Created by Chris Rupley 2014-08-16
#Coursera R Programming, Programming Assignment 1 Part 2

complete <- function(directory, id = 1:332) {
    
    allData <- NULL
    total <- NULL
    for(i in seq_along(id)){
        if(id[i] < 10){
            filechar <- paste("00", as.character(id[i]), sep="")#;print(filechar)
        } else if(id[i] > 9 && id[i] < 100){
            filechar <- paste("0", as.character(id[i]), sep="")#;print(filechar)
        } else {
            filechar <- as.character(id[i])#;print(filechar)
        }
        filename <- paste(directory, "/", filechar, ".csv", sep="")
        
        currentData <- read.csv(filename)
        x <- rowSums(is.na(currentData))
        total <- length(x[x == 0])
        
        allData <- c(allData, total)
        rm(currentData)
    }
    
    data.frame("id"=id, "nobs"=allData)
    
}