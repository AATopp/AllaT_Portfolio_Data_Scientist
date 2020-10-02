#Alla Topp
#MSDS 680 - Machine Learning
#Week 3 Project 
#_________________________________

temp<- tempfile()
download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00228/smsspamcollection.zip",temp)
msgfile<- unz(temp, "SMSSpamCollection")
spam_ham<- read.csv2(msgfile, header= FALSE, sep= "\t", quote= "", col.names= c("type","text"),
                     stringsAsFactors= FALSE) #or use read.csv()
unlink(temp)

str(spam_ham)
spam_ham$type <- factor(spam_ham$type) # convert into factor
str(spam_ham$type)
table(spam_ham$type)

install.packages("tm")
library(tm)
sms_corpus <- VCorpus(VectorSource(spam_ham$text)) #to create a corpus
print(sms_corpus) # to see if corpus contains documents for each message in the training data 
inspect(sms_corpus[1:2]) #To receive a summary of specific messages

as.character(sms_corpus[[1]]) #To view the actual message text
lapply(sms_corpus[1:2], as.character) #To view multiple documents

#lower case characters 
sms_corpus_clean <- tm_map(sms_corpus, content_transformer(tolower)) 
as.character(sms_corpus_clean[[1]]) #chacking if words are lowercase

#removing numbers from the messages
sms_corpus_clean <- tm_map(sms_corpus_clean, removeNumbers)

#remove filler words such as to, and, but, and or from our SMS messages. 
sms_corpus_clean <- tm_map(sms_corpus_clean, removeWords, stopwords()) 

# eliminate any punctuation 
sms_corpus_clean <- tm_map(sms_corpus_clean, removePunctuation) 

# reducing words to their root form
install.packages("SnowballC") 
library(SnowballC) 
sms_corpus_clean <- tm_map(sms_corpus_clean, stemDocument)

# to remove additional whitespace
sms_corpus_clean <- tm_map(sms_corpus_clean, stripWhitespace) 

# final result after cleaning 
as.character(sms_corpus_clean[[5]])

# Creating Document-Term-Matrix 
sms_dtm <- DocumentTermMatrix(sms_corpus_clean) 
sms_dtm

# Creting train and test sets
sms_dtm_train <- sms_dtm[1:4180, ] # 75% for training
sms_dtm_test  <- sms_dtm[4181:5574, ] # 25% for testing 
sms_train_labels <- spam_ham[1:4180, ]$type 
sms_test_labels  <- spam_ham[4181:5574, ]$type

#testing the proportion of spam in training and test data frames
prop.table(table(sms_train_labels))
prop.table(table(sms_test_labels))

# Visualizing text data 
install.packages("wordcloud") 
library(wordcloud) 
wordcloud(sms_corpus_clean, min.freq = 75, random.order = FALSE) #creates worldcloud 

sms.spam <- subset(spam_ham, type == "spam") #spam dataframe containing the raw text strings for SMSes
sms.ham <- subset(spam_ham, type == "ham") #ham dataframe containing the raw text strings for SMSes

#creating wordcloud with ham and spam data 
wordcloud(sms.spam$text, max.words = 35, scale = c(3, 0.5)) 
wordcloud(sms.ham$text, max.words = 40, scale = c(3, 0.5)) 

#creating indicator features for frequent words for the model
sms_freq_words <- findFreqTerms(sms_dtm_train, 5)
str(sms_freq_words)

#Additional exercise 
#The top 5 frequent words from sms data
most.freq<- sort(colSums(as.matrix(sms_dtm)), decreasing = TRUE)
head(most.freq,5)

#most 5 frequent words in spam and ham data 
wordcloud(sms_corpus_clean[which(spam_ham$type == 'spam')], max.words = 5, scale=c(3,0.20))
wordcloud(sms_corpus_clean[which(spam_ham$type == 'ham')], max.words = 5, scale=c(3,0.20))


#Filter our DTM to include only the terms appearing in a specified vector.
sms_dtm_freq_train<- sms_dtm_train[ , sms_freq_words] 
sms_dtm_freq_test <- sms_dtm_test[ , sms_freq_words]
sms_dtm_freq_train

convert_counts <- function(x) {x <- ifelse(x > 0, "Yes", "No")} # convert counts to  Yes/No strings
sms_train <- apply(sms_dtm_freq_train, MARGIN = 2, convert_counts) #allows a function to be used on each of the rows or columns  in a matrix. 
sms_test <- apply(sms_dtm_freq_test, MARGIN = 2, convert_counts) # the same for test data 

#Naive Bayes algorithm application 
install.packages("e1071") 
library(e1071) 

sms_classifier <- naiveBayes(sms_train, sms_train_labels) 
sms_classifier

#evaluation model performance 
sms_test_pred <- predict(sms_classifier, sms_test) # used to make predictions

#To compare the predictions to the true values
library(gmodels) 
CrossTable(sms_test_pred, sms_test_labels, prop.chisq = FALSE, prop.t = FALSE, dnn = c('predicted', 'actual')) 

#Improving model performance
sms_classifier2 <- naiveBayes(sms_train, sms_train_labels, laplace = 1)
sms_test_pred2 <- predict(sms_classifier2, sms_test)
CrossTable(sms_test_pred2, sms_test_labels, prop.chisq = FALSE, prop.t = FALSE, prop.r = FALSE,
           dnn = c('predicted', 'actual'))
