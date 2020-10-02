#Alla Topp
#MSDS 680 Machine Learning 
#Assignment Week 4

#Installing packages and libraries 
install.packages("rpart")
install.packages("rpart.plot")
install.packages("caret")
install.packages("randomForest")

library(randomForest)
library(rpart)
library(rpart.plot)
library(caret)

#Importing the dataset 
wine <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"),
                 header = TRUE, sep = ";")

#Data exploration 
str(wine) #creating data frame
table(wine$quality)
names(wine) #listing all the names of the columns
sum(is.na(wine)) #checking if we have any missing values 
wine$quality <- as.factor(wine$quality) #changing predictor quakity to a factor
str(wine$quality)
hist_quality <- as.numeric(wine$quality) # a histogram of the frequency of wine quality ratings.
hist(hist_quality)

# Splitting data into Training and test set
s <- sample(1599, 1119) #devided dataset into 70/30
wine_train <- wine[s, ]
wine_test <- wine[-s, ]
dim(wine_train)
dim(wine_test)

#working with 'rpart" library and building decision tree model
tm = rpart(quality~., data = wine_train, method = "class") # build a classification tree model
tm # retrieve the node detail of the classification tree
printcp(tm) #examine the complexity parameter
plotcp(tm)
summary(tm) #examine the built model
rpart.plot(tm, uniform=TRUE, tweak = 1.5, extra = 101, type = 4) # visualzing the tree 

#prediction performance
predictions <- predict(tm, wine_test, type = "class") #generate a predicted label of testing the dataset
table(wine_test$quality, predictions)

#working with library caret and generating confusion matrix
confusionMatrix(table(predictions, wine_test$quality)) # generate a confusion matrix based on the classification table

#Pruning 
min(tm$cptable[,"xerror"]) #Find the minimum cross-validation error of the classification tree model
which.min(tm$cptable[,"xerror"]) #Locate the record with the minimum cross-validation errors
tm.cp = tm$cptable[6,"CP"] #Get the cost complexity parameter of the record with the minimum cross-validation errors: 
tm.cp
prune.tree.tm = prune(tm, cp= tm.cp) #Prune the tree by setting the cp parameter to the CP value of the record with minimum cross-validation errors
rpart.plot(prune.tree.tm, uniform=TRUE, tweak = 1.5, extra = 101, type = 4) #Visualize the classification tree 

#predictions for pruning tree
predictions.prune <- predict(prune.tree.tm, wine_test, type = "class") #generate a classification table based on the pruned classification tree model 
table(wine_test$quality, predictions.prune)
confusionMatrix(table(predictions.prune, wine_test$quality)) #generate a confusion matrix based on the classification table

#building random forest model
barplot(table(wine$quality)) #generating barplot 

#grouping wine ranks into 3 groups 
wine2 <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"), 
                  header = TRUE, sep = ";")
wine2$taste <- ifelse(wine2$quality < 5, "bad", "good")
wine2$taste[wine2$quality == 5] <- "normal"
wine2$taste[wine2$quality == 6] <- "normal"
wine2$taste <- as.factor(wine2$taste)
str(wine2$taste)
barplot(table(wine2$taste))
table(wine2$taste)

#random forest train and test sets 
samp <- sample(1599, 1119)
wine_train2 <- wine2[samp, ]
wine_test2 <- wine2[-samp, ]
dim(wine_train2)
dim(wine_test2)

#random forest model and table with predictions 
model <- randomForest(taste ~ . - quality, data = wine_train2)
model
prediction <- predict(model, newdata = wine_test2)
table(prediction, wine_test2$taste)
(0+34+394)/nrow(wine_test2)
 

tm$variable.importance
