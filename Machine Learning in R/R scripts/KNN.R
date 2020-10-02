#Alla Topp
#MSDS 680- Machine Learning
#Assignment 2, KNN

df <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/heart-disease/processed.cleveland.data", na.strings="?", sep = "," )
colnames(df) <- c("age","sex","cp","trestbps","chol","fbs","restecg","thalach","exang","oldpeak","slope","ca","thal","pred")
View(df)

# Data Exploration
str(df)
summary(df) #display summary statistics NA's in ca=4, NA's in thal=2
hist(df$age)
hist(df$chol)
hist(df$trestbps)
hist(df$thalach)

#Missing data
summary(df) # run summary again to see where are the missing values (ca and thal)
df.omit <- na.omit(df) # assign result to a new object 
summary(df.omit) # there are no NA's (in new object)

#Normalize/standardize data 
normalize <- function(x) {return((x-min(x))/(max(x)-min(x)))}
df_norm <- as.data.frame(lapply(df.omit[,c(1,4,5,8,10)],normalize)) #normalized columns 1,4,5,8,10
View(df_norm)

#Convert to dummy variables 
library(caret)
cat_vars <- as.data.frame(lapply(df.omit[,c(3,7,11:13)],as.factor)) # takes a list and applies a specifed function to each list element.
dummy <- dummyVars(~.,data=cat_vars,fullRank = TRUE)
df_dummy <- as.data.frame(predict(dummy,newdata=cat_vars))
View(df_dummy)

#Aggregate dependent 
df.omit$pred <- with(df.omit, ifelse(df.omit$pred >=1, 1, 0)) #change pred to 0 or 1
df.omit$pred <- as.factor(df.omit$pred) #change predicted variable to factor (for classification problem)
df.omit$pred

#Combine variable back
df_all <- cbind(df.omit$ca,df.omit$fbs,df_norm,df_dummy,df.omit$pred) # combine features with cbind()
df_all

#Split data into training and test set
set.seed(555)
idx <- sample(2, nrow(df.omit), replace=TRUE, prob=c(0.7, 0.3))  #create 2 samples with ratio 70:30
idx
df.train <- df.omit[idx==1, ] #sample 1 for training set
df.test <- df.omit[idx==2,] # sample 2 for test set

#Build the KNN model / evaluate the model
library(class) 
knn_pred <- knn(train=df.train, test=df.test,cl=df.train$pred,k=1) #change to your object names and vary k value
knn_pred

#Evaluate the model
install.packages("gmodels") 
library(gmodels) 
CrossTable(x=df.test$pred, y= knn_pred, prop.chisq=FALSE)

#where k=1 
knn_pred <- knn(train=df.train, test=df.test,cl=df.train$pred,k=1) #change to your object names and vary k value
knn_pred
CrossTable(x=df.test$pred ,y= knn_pred, prop.chisq=FALSE)

#Where k=3
knn_pred <- knn(train=df.train, test=df.test,cl=df.train$pred,k=3) #change to your object names and vary k value
knn_pred
CrossTable(x=df.test$pred ,y= knn_pred, prop.chisq=FALSE)

#where k=5
knn_pred <- knn(train=df.train, test=df.test,cl=df.train$pred,k=5) #change to your object names and vary k value
knn_pred
CrossTable(x=df.test$pred ,y= knn_pred, prop.chisq=FALSE)

# where k=15 
knn_pred <- knn(train=df.train, test=df.test,cl=df.train$pred,k=15) #change to your object names and vary k value
knn_pred
CrossTable(x=df.test$pred ,y= knn_pred, prop.chisq=FALSE)

#where k=22
knn_pred <- knn(train=df.train, test=df.test,cl=df.train$pred,k=22) #change to your object names and vary k value
knn_pred
CrossTable(x=df.test$pred ,y= knn_pred, prop.chisq=FALSE)
