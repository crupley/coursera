#R Programming
#Quiz 1

#Chris Rupley
#8/5/14

data <- read.csv(file="hw1_data.csv")

data[1:2,]	#Q12

length(data)	#Q13

data[152:152,]	#Q14

data$Ozone[47]	#Q15

length(data$Ozone[is.na(data$Ozone)])	#Q16

mean(data$Ozone, na.rm = TRUE)	#Q17

index <- data$Ozone>31&data$Temp>90
index[is.na(index)]<-FALSE
mean(data$Solar.R[index])	#Q18

mean(data$Temp[data$Month==6])	#Q19

max(data$Ozone[data$Month==5 & !is.na(data$Ozone)])	#Q20