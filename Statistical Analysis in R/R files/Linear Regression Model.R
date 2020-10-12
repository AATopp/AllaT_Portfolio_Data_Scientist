# Alla Topp
# MSDS 660
# Linear regression model in R

install.packages("ISLR") #install the package for the first time
library("ISLR")   #load the package
data("Carseats") #load specified data set, here "Carseats"
attach(Carseats)

str(Carseats)     # display structure summary(Carseats) # get summary of your data set/data frame
names(Carseats)   # Lists names of variables in a data.frame
plot(Carseats)


# Data exploration with graphs (hist and density)
hist(Sales) # create histograms where "Sales" values are plotted
hist?Income)   # create histograms where "Income" values are plotted
hist(Advertising) # create histograms where "Advertising" values are plotted
hist(Population)  # create histograms where "Population" values are plotted

plot(density(Sales)) #returns the density data and plots the results of "Sales" 
plot(density(Income))
plot(density(Advertising))
plot(density(Population))


# Pairwise scatterplot (positive correlation, negative or no correlation?)
pairs(Carseats[,1:5]) #visually checks possible correlated variables.
cor(Carseats[,1:5]) #calculate correlation coefficient between variables


# Select 1 independant(x) and dependent(y), scatterplot of the variables 
x <- Carseats$Sales  # independent variable 
y <- Carseats$Price    # dependant variable
#produces scatterplot of the variables X and Y with X on the x-axis and Y on the y-axis. 
plot(x,y, xlab = "Sales", ylab = "Price", col ="Blue") 

#Runs a regression of Y on X where Y is a dependent variable and X is an independent variable.
lm_carseats = lm(y ~ x)  #saves all outputs to an object "lm_carseats"
# adds a regression line on the scatterplot graphed earlier 
abline(lm(y ~ x), col = "red") 

# shows the model formula, residual quartiles, coefficient estimate with std error, 
# and a significance test, multiple and adjusted R-square, and F-test for model fit
summary(lm_carseats) 


# State your null and alternative hypothesis
t.test(x,y) # Performs a t-test of means between two variables X and Y for the hypothesis H0 : µX = µY . Gives t-statistic, p-value and ?5% confidence interval. 




