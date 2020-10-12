# Alla Topp
# MSDS 660
# Project week 3

library("ISLR")   # loads the package
data("Carseats") # loads specified data set, here "Carseats"
attach(Carseats) # attaches objects to R search path so that we can accessed by column name

# 1) Data exploration
summary(Ca?seats) # get summary of your data set/data frame
str(Carseats)     # display structure 
names(Carseats)   # Lists names of variables in a data.frame

# 2) Test the entire model using global F-test
lm.model = lm(Sales ~ Price+CompPrice+Income, data= Carseats? # runs a multiple linear regression 
summary(lm.model)  # output from the linear model
print(lm.model)

#3) Testing significance of each x variable. Gives t-statistic, p-value and 95% connfidence interval. 
t.test(Sales, Price) # Performs a t-test of means between two variables X and Y for the hypothesis H0 : µX = µY .
t.test(Sales, CompPrice) #t-test of means between Sales and CompPrices
t.test(Sales, Income) #t-test of means between Sales and Income

# list the coefficients, another formula for it is coef(lm.model)
lm.model

# 4 Different model exploration
lm2 = lm(Sales~Population+Age+Education)
summary(lm2)

#Multicollinarity
pairs(Carseats[,1:5])  # do pair plot
cor(subset(Carseats, select=?c(ShelveLoc,Urban,US)))  # omit qualitative data
plot(lm.model) # plots the model diagnostic checking for normality of error term, heteroscedasticity

# Checking Variance Inflation Factor
install.packages("car")
library(car) # load the package 
vif(lm.model) # calculates the VIFs for each of the predictors of a model.
vif(lm2) #output from VIF

# Exploring the whole data model 
carseats.lm <- lm(Sales ~ ., data = Carseats)
carseats.lm
summary(carseats.lm) 
vif(carseats.lm) 
