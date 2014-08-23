#R programming coursera
#programming assignment 2

library(datasets)
data(iris)

# ?iris

#hat is the mean of 'Sepal.Length' for the species virginica?
Q1 <- mean(iris$Sepal.Length[iris$Species == "virginica"])

# what R code returns a vector of the means of the variables 'Sepal.Length', 
#'Sepal.Width', 'Petal.Length', and 'Petal.Width'?
Q2 <- apply(iris[, 1:4], 2, mean)

#How can one calculate the average miles per gallon (mpg) by number 
#of cylinders in the car (cyl)?
data(mtcars)
Q3 <- tapply(mtcars$mpg, mtcars$cyl, mean)

#what is the absolute difference between the average horsepower of 
#4-cylinder cars and the average horsepower of 8-cylinder cars?
hpmean <- tapply(mtcars$hp, mtcars$cyl, mean)
Q4 <- hp["8"] - hp["4"]

