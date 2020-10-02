#Alla Topp
#MSDS 680 Machine Learning 
#Support Vector Machines and Artificial Neural Network
#_______________________________________________________
library(caret)
library(e1071)
library(nnet)
mushroom_df <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data",
                          na.strings="?", sep = "," )
str(mushroom_df)
#Rename the variables (colums), wo we have names for each column 
colnames(mushroom_df) <- c("edibility", "cap_shape", "cap_surface", "cap_color", "bruises", "odor",
                           "grill_attachement", "grill_spacing", "grill_size", "grill_color", 
                           "stalk_shape", "stalk_root", "stalk_surface_above_ring", 
                           "stalk_surface_below_ring", "stalk_color_above_ring",
                           "stalk_color_below_ring", "veil_type", "veil_color", 
                           "ring_number", "ring_type", "spore_print_color", "population", "habitat")
str(mushroom_df)
summary(mushroom_df)
mushroom_df <- subset(mushroom_df, select = -veil_type) #removing the column with 1 level (veil_type)

sum(is.na(mushroom_df))
#mushroom[ mushroom == "u" ] <- NA
levels <- levels(mushroom_df$stalk_root)
levels[length(levels) + 1] <- "U"
mushroom_df$stalk_root <- factor(mushroom_df$stalk_root, levels = levels)
mushroom_df$stalk_root[is.na(mushroom_df$stalk_root)] <-"U"
summary(mushroom_df)
sum(is.na(mushroom_df))

#change all the factor variables to numeric variables
mushroom_df$cap_shape <- as.numeric(mushroom_df$cap_shape)
mushroom_df$cap_surface <- as.numeric(mushroom_df$cap_surface)
mushroom_df$cap_color <- as.numeric(mushroom_df$cap_color)
mushroom_df$bruises <- as.numeric(mushroom_df$bruises)
mushroom_df$odor <- as.numeric(mushroom_df$odor)
mushroom_df$grill_attachement <- as.numeric(mushroom_df$grill_attachement)
mushroom_df$grill_spacing <- as.numeric(mushroom_df$grill_spacing)
mushroom_df$grill_size <- as.numeric(mushroom_df$grill_size)
mushroom_df$grill_color <- as.numeric(mushroom_df$grill_color)
mushroom_df$stalk_shape <- as.numeric(mushroom_df$stalk_shape)
mushroom_df$stalk_root <- as.numeric(mushroom_df$stalk_root)
mushroom_df$stalk_surface_above_ring <- as.numeric(mushroom_df$cap_shape)
mushroom_df$stalk_surface_below_ring <- as.numeric(mushroom_df$cap_shape)
mushroom_df$stalk_color_above_ring <- as.numeric(mushroom_df$stalk_color_above_ring)
mushroom_df$stalk_color_below_ring <- as.numeric(mushroom_df$stalk_color_below_ring)
mushroom_df$veil_color <- as.numeric(mushroom_df$veil_color)
mushroom_df$ring_number <- as.numeric(mushroom_df$ring_number)
mushroom_df$ring_type <- as.numeric(mushroom_df$ring_type)
mushroom_df$spore_print_color <- as.numeric(mushroom_df$spore_print_color)
mushroom_df$population <- as.numeric(mushroom_df$population)
mushroom_df$habitat <- as.numeric(mushroom_df$habitat)

#hisrogram 
mushroom_df_edibility <- as.numeric(mushroom_df$edibility)
hist(mushroom_df_edibility)
table(mushroom_df_edibility)

#quick calculation, to see what is % of the poisonous and edible
4208/8124
3916/8124

#splitting data into train and test sets 
8124*0.7 #70% of the data 
8124*0.3 #30% of the data

s <- sample(8124, 5687) 
mushroom_train <- mushroom_df[s, ] #train set as 0.7
mushroom_test <- mushroom_df[-s, ] #test set as 0.3
dim(mushroom_train)
dim(mushroom_test)

#building SVM model #1, kernel = linear 
str(mushroom_train) #data frame of train data
svm_model_mush <- svm(edibility ~ ., data = mushroom_train, kernel = 'linear', cost = 1, scale = FALSE)
print(svm_model_mush) #print the model

#Predict the label of the testing dataset based on the fitted SVM and attributes of the testing dataset
svm.pred = predict(svm_model_mush, mushroom_test[, !names(mushroom_test) %in% c("edibility")])
summary(svm_model_mush) #summary of the model

#generate a classification table with the prediction result and labels of the testing dataset
svm.table = table(svm.pred, mushroom_test$edibility) 
svm.table
confusionMatrix(svm.table) #use a confusion matrix to measure the performance of the model

#SVM model #2 
svm2 <- svm(edibility ~ ., data = mushroom_train, kernel = 'linear', cost = 100, scale = FALSE)
summary(svm2)

svm.pred2 = predict(svm2, mushroom_test[, !names(mushroom_test) %in% c("edibility")])
svm.table2 = table(svm.pred2, mushroom_test$edibility)
svm.table2

confusionMatrix(svm.table2) 

#SVM model #3 with kernel = "radial"
svm3 <- svm(edibility ~ ., data = mushroom_train, kernel = 'radial', cost = 100, scale = FALSE)
summary(svm3)

svm.pred3 = predict(svm3, mushroom_test[, !names(mushroom_test) %in% c("edibility")])
svm.table3 = table(svm.pred3, mushroom_test$edibility)
svm.table3

confusionMatrix(svm.table3)

#SVM model #4 with kernel = "polynomial"
svm4 <- svm(edibility ~ ., data = mushroom_train, kernel = 'polynomial', cost = 100, scale = FALSE)
summary(svm4)

svm.pred4 = predict(svm4, mushroom_test[, !names(mushroom_test) %in% c("edibility")])
svm.table4 = table(svm.pred4, mushroom_test$edibility) #set the table to produce it 
svm.table4 #print the table 

confusionMatrix(svm.table4)

#___________________________________
#Nueral Network algorithm 

mushroom_ann <- read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/mushroom/agaricus-lepiota.data",
                          na.strings="?", sep = "," )
str(mushroom_ann)
#Rename the variables (colums), wo we have names for each column 
colnames(mushroom_ann) <- c("edibility", "cap_shape", "cap_surface", "cap_color", "bruises", "odor",
                           "grill_attachement", "grill_spacing", "grill_size", "grill_color", 
                           "stalk_shape", "stalk_root", "stalk_surface_above_ring", 
                           "stalk_surface_below_ring", "stalk_color_above_ring",
                           "stalk_color_below_ring", "veil_type", "veil_color", 
                           "ring_number", "ring_type", "spore_print_color", "population", "habitat")
str(mushroom_ann)
summary(mushroom_ann)
mushroom_ann <- subset(mushroom_ann, select = -veil_type) #removing the column with 1 level (veil_type)

sum(is.na(mushroom_ann))
#mushroom[ mushroom == "u" ] <- NA
levels <- levels(mushroom_ann$stalk_root)
levels[length(levels) + 1] <- "U"
mushroom_ann$stalk_root <- factor(mushroom_ann$stalk_root, levels = levels)
mushroom_ann$stalk_root[is.na(mushroom_ann$stalk_root)] <-"U"
summary(mushroom_ann)
sum(is.na(mushroom_ann))

#creating train and test sets and converting into dummy variables
splitting <- createDataPartition(mushroom_ann$edibility, p = .7, list = FALSE) #splitting data into 70/30
dummy <- subset(mushroom_ann, select = -edibility)
mush_ann_dummy <- dummyVars(~., data = dummy, sep = ".") #creating a full set of dummy variables
mush_ann_dummy <- data.frame(predict(mush_ann_dummy, dummy))
mush_ann_dummy$edibility <- mushroom_ann$edibility #dummy vars of edibility

train_ann <- mush_ann_dummy[splitting,] #split into .7
test_ann <- mush_ann_dummy[-splitting,] #split into .3
testLabels <- subset(test_ann, select = edibility) #selecting variables from edibility 
testset <- subset(test_ann, select = -edibility) #creating tetsset of edibility

#using library nnet to construct the ANN
net <- nnet(edibility ~ ., data = train_ann, size = 2, rang = 0.1, maxit = 200) #train the neural network with nnet
summary(net) #obtain information about the trained neural network

#prediction ann
mush_ann.predict <- predict(net, testset, type = "class") #Generate the predictions of the testing dataset based on the model
net.table <- table(test_ann$edibility, mush_ann.predict) #Generate a classification table based on the predicted labels and labels of the testing dataset
net.table
confusionMatrix(net.table) # generate a confusion matrix based on the classification table

