# Alla Topp
# Logistic regression

SomeDataSet <- read.csv(file.choose(), header=T) #input the dataset into R from the csv file
View(SomeDataSet)
head(SomeDataSet)
str(SomeDataSet)

#logistic regression model
fit <- glm(CHD ~ Age, data = SomeDataSet, family = binomial(logit))
summary(fit)# display results
#confint(fit)
#exp(coef(fit))
#exp(confint(fit))
predict(fit, type="response") # predicted values
residuals(fit, type="deviance") # residuals

#4 Compare the null model with your fit model
anova(fit, test='Chisq') #compare nested models
