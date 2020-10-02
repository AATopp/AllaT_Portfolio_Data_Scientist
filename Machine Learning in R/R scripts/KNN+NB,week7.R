#Alla Topp
#Week 7, Evaluating Performance Measures
#using libraries 
library(class)
library(gmodels)
library(caret)
library(e1071)
library(klaR)

abalone <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data"),
  ?                 header = FALSE, sep = ",")
colnames(abalone) <- c("sex", "length", 'diameter', 'height', 'whole_weight', 'shucked_wieght',
                       'viscera_wieght', 'shell_weight', 'rings' )
summary(abalone)
str(abalone)

#creating new colu?n age as was described in the assignment
abalone$age <- abalone$rings+1.5 #create a new variable 'age'
abalone_new <- abalone #assign original abalone to the new object that includes 'age'
abalone_new$age <- cut(abalone_new$age, breaks = c(0,7,12,100),
   ?                  labels = c("young","adult","old")) # aggregrate into 3 groups
abalone_new$age <- as.factor(abalone_new$age)
abalone_new <- subset(abalone_new, select = -rings) # remove Rings otherwise the output will associate with Rings
summary(abalone_?ew$age)

#Knn
knn_abalone <- abalone_new #creating new df without column sex
knn_abalone$sex <- NULL #removing column sex

#normalizing our data 
normalize <- function(x) {return ((x - min(x)) / (max(x) - min(x)))}
knn_abalone[1:7] <- as.data.frame(lapply(?nn_abalone[1:7], normalize))
summary(knn_abalone$shucked_wieght)

#splitting the data to training and testing set
set.seed(555)
ind <- sample(2, nrow(knn_abalone), replace=TRUE, prob=c(0.7, 0.3)) #splitting to 70/30
KNN_train <- knn_abalone[ind==1,] #train?ng set containing 70% of data 
KNN_test <- knn_abalone[ind==2,] #testing set containing 30% data

#KNN model with k=54 based on the train set
KNN_pred <- knn(train = KNN_train[1:7], test = KNN_test[1:7], cl = KNN_train$age, k = 54)
CrossTable(x = KNN_test$?ge, y = KNN_pred, prop.chisq = FALSE) #producing cross table 
confusionMatrix(table(KNN_test$age, KNN_pred)) #producing confusion matrix

#Naive Bayes 
NB_train <- KNN_train #using the same training set for the model 
NB_test <- KNN_test #using the same te?t set for the NB model 

#model
model <- naiveBayes(age ~., data = NB_train)
model
pred <- predict(model, NB_test)
print(confusionMatrix(pred,NB_test$age))

#10-fold cross validation
train_control <- trainControl(method = "cv", number = 10)
cv_model <- tra?n(age~., data = knn_abalone, trControl=train_control,method ="nb")
print(cv_model)

#Repeated k-fold Cross Validation
train_control2 = trainControl(method="repeatedcv", number=10, repeats=3)
cv_model2 <- train(age~., data = knn_abalone, method = "knn", pre?rocess="scale", trControl=train_control2)
cv_model2
