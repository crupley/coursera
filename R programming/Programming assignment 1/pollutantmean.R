#pollutantmean.R
#Created by Chris Rupley 2014-08-16
#Coursera R Programming, Programming Assignment 1 Part 1


pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    allData <- NULL
    ## Load all data files and store in object
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
#         print(length(currentData[[pollutant]]))
        allData <- c(allData, currentData[[pollutant]])
#         print(length(allData))
        rm(currentData)
    }
    
    #compute the mean of the desired pollutant
    mean(allData, na.rm=TRUE)
}