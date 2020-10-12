# Alla Topp
# Two way ANOVA

SomeDataSet <- read.csv(file.choose(), header=T) #input the dataset into R from the csv file
View(SomeDataSet)
head(SomeDataSet)

# data exploration with boxplot 
boxplot(data = SomeDataSet, Salary~Profession, xlab='Profession', ylab = "Salary", main="Salary vs Profession")
boxplot(data = SomeDataSet, Salary~Region, xlab='Region', ylab = "Salary", main="Salary vs Region")

# boxplot(Salary~Profession * Region, data = SomeDataSet,xlab='Profession * Region', ylab = "Salary", cex.axis=0.7,main='Salary v.s. Profession * Region')

# multiple linear regression model
lm.model = lm(data =SomeDataSet, Salary ~ Profession * Region)
summary(lm.model) # summary of the model
print(lm.model) # shows coefficients

# ANOVA model with 
anova_test <- aov(Salary~Profession * Region, data = SomeDataSet)
summary(anova_test)

# interaction plot 
with(data = SomeDataSet, interaction.plot(Region, Profession, Salary,col = c("blue4", "red4","green4")))

# checking assumptions of the model 
plot(lm.model) # plots 4 graphs,checks anova assumptions

# post-hoc comparison test to the results of the two-way ANOVA model
TukeyHSD(anova_test)

# Plot TukeyHSD 
plot(TukeyHSD(anova_test))
