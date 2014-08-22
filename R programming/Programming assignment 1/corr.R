#corr.R
#Created by Chris Rupley 2014-08-16
#Coursera R Programming, Programming Assignment 1 Part 3


corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    id<-1:332
    allData <- numeric(0)
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
        completeRows <- rowSums(is.na(currentData))
        correlation <- cor(currentData$sulfate[completeRows == 0], currentData$nitrate[completeRows == 0])
        if (sum(completeRows==0) > threshold){allData <- c(allData, correlation)}
#         allData
    }
    allData
    
}
