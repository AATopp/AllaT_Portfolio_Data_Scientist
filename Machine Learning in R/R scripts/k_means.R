#Alla Topp
#MSDS 680 Machine Learning 
#K-Means and HCA
#_______________________________________________________

library(corrplot)
library(cluster)
library(factoextra) 
library(NbClust)

wholesale_df <- read.table("https://archive.ics.uci.edu/ml/machine-learning-databases/00292/Wholesale customers data.csv",
                          na.strings="?", sep = ",", header = TRUE )
str(wholesale_df)
summary(wholesale_df) #produce summary of the data 
sum(is.na(wholesale_df)) #checking for missing values 

table(wholesale_df$Channel)
table(wholesale_df$Region)

#removing channel and region variables 
new_wholesale <- wholesale_df #creating df without channel and region 
new_wholesale$Channel <- NULL
new_wholesale$Region <- NULL 
summary(new_wholesale) #checking if two columns are gone 

#normalizing the data 
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
new_wholesale[1:6] <- as.data.frame(lapply(new_wholesale[1:6], normalize))
summary(new_wholesale)

#finding optimal clusters for the given data set with silhouette method
silhouette_score <- function(k){
  km <- kmeans(new_wholesale, centers = k, nstart=25)
  ss <- silhouette(km$cluster, dist(new_wholesale))
  mean(ss[, 3])}

k <- 2:10
avg_sil <- sapply(k, silhouette_score)
plot(k, type='b', avg_sil, xlab='Number of clusters', ylab='Average Silhouette Scores', frame=FALSE)
k[which.max(avg_sil)]

#creating two clusters
set.seed(22)
fit = kmeans(new_wholesale, 2)
fit

#inspect the center of each cluster using barplot
barplot(t(fit$centers), beside = TRUE, xlab="cluster", ylab="value")
plot(new_wholesale$Fresh,new_wholesale$Frozen, col = fit$cluster) #scatter plot of the data 

#drawing bivariate cluster plot
clusplot(new_wholesale, fit$cluster, color = TRUE, shade = TRUE)

#plotting claster with two variables "milk" and "Delicassen"
plot(new_wholesale[c("Milk", "Delicatessen")], col = fit$cluster, cex = .5)
points(fit$centers[,c("Milk", "Delicatessen")], col=5, pch="X")



#HCA 
hca_wholesale <- read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/00292/Wholesale%20customers%20data.csv"),
                 header = TRUE, sep = ",")
hca_wholesale$Channel <- NULL #removing column channel 
hca_wholesale$Region <-NULL #removing culumn region 

#normalizing data for hca 
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
hca_wholesale[1:6] <- as.data.frame(lapply(hca_wholesale[1:6], normalize))

nb_wholesale <- NbClust(hca_wholesale, distance = "euclidean", min.nc = 2,
              max.nc = 10, method = "ward.D2")
fviz_nbclust(nb_wholesale)

hc_clust = hclust(dist(hca_wholesale, method="euclidean"), method="ward.D2")
hc_clust

#plotting a dendogram
plot(hc_clust, hang = -0.01, cex = 0.7)

#cut the hierarchy of clusters into a given number of clusters
fit <- cutree(hc_clust, k = 3) # categorize the data into three groups
table(fit) #Count the number of data within each cluster

plot(hc_clust) #visualizing how data is clustered 
rect.hclust(hc_clust, k = 4, border = "red") #Cutting at different heights of the dendrogram

#performing hierarchical clustering with "single" linkage 
hc_clust2 = hclust(dist(hca_wholesale), method="single")
plot(hc_clust2, hang = -.01, cex = .7)

fit2 <- cutree(hc_clust2, k = 2)
table(fit2)

#performing hierarchical clustering with "complete" linkage 
hc_clust3 = hclust(dist(hca_wholesale), method="complete")
plot(hc_clust3, hang = -.01, cex = .7)
hc_clust3
rect.hclust(hc_clust3, k = 4, border = "red") 
