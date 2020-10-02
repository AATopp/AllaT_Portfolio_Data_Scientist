#Alla Topp
#MSDS 680 Machine learning 
# Assignment 1

#Exploratoty analysis

data("quakes")
View(quakes) # data viewer in a spreadsheet style
str(quakes) # print out the structure of the data/object
names(quakes) # print the column labels/names
summary(quakes) # simply summary statistics: min, max, mean, median, upper/lower quartile
head(quakes) # return the first past of the object/data frame
tail(quakes) # return the last part of the object/data frame
cor(quakes) # compute correlation between x and y 
pairs(quakes) # produce a matrix of scatter plots
ls(quakes) # ls will list the column names 
hist(quakes [,1]) #histogram plot column 1

#Question 1 
#Test for missing values from excel table 
def<- read.csv(file.choose(), header=T) #read the csv file
def
# identify NAs in the table
is.na(def)
# identify location of NAs in vector
which(is.na(def))
# identify count of NAs in data frame
sum(is.na(def))

na.omit(def)

# Question 2
#Impute the missing values with mean or median

Item.1 <- c(25,36,31,NA,51,47,47,52)
Item.1
Item.1[is.na(Item.1)] <- mean(Item.1,na.rm =TRUE)
mean(Item.1, na.rm = TRUE)
round(Item.1,1)

#Question 3 
#Scale or normalize the data (column)
mydata<-cars
View(mydata)
normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x)))} #
mydata$speed_norm<-normalize(mydata$speed) #
mydata$dist_norm<-normalize(mydata$dist) #
View(mydata)

#Question 4
#Convert a categorical variable to dummy variables 
install.packages("caret")
library(caret)

#creating a data frame
animals <- data.frame(id=c(1,2,3,4,5), 
                      anm = c('cat','dog','rabbit','dog','fish'),
                      gender=c('male', 'female', 'female', 'female','male'))
# dummify the data
dmy <- dummyVars(" ~ .", data = animals) #transform all characters and factors columns
trsf <- data.frame(predict(dmy, newdata = animals))
print(trsf)

dmy <- dummyVars(" ~ .", data = animals, fullRank=T) #avoid highly correlated variables
trsf <- data.frame(predict(dmy, newdata = animals))
print(trsf)


#Data Explorer package 
install.packages("DataExplorer")
library(DataExplorer)
choco <- read.csv(file.choose(), header = T, stringsAsFactors = F)
plot_str(choco)
plot_missing(choco)
plot_histogram(choco)
plot_density(choco)
plot_correlation(choco, type = 'continuous','Review.Date')
plot_bar(choco)
plot_boxplot(choco, by = "Company.Location") 
plot_scatterplot(choco, by = "Broad.Bean.Origin") 
create_report(choco)
