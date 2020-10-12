# Alla Topp
# MSDS 660 Statistical Analysis and Experimental Design
# ANOVA model

# creating 3 vectors 
a=c(14,24,12,25) # vector A treatment
b=c(20,14,17,18) # vector B treatment 
c=c(22,29,36,20) # vector with values from C treatment 
treatments = c(aTreat,bTreat,cTreat) # combining 3 vectors in one vector 

# creating 3 levels where all the data from the vector stored 
groups = factor(rep(letters[1:3], each = 4)) 
fit =lm(formula = treatments ~ groups) #organizing the values fitting the model 
summary(fit) #
anova(fit) # produces the anova model 

bartlett.test(treatments,groups) 
fligner.test(treatments,groups)

trmt.type = c(rep("A",4), rep("B", 4), rep("C",4))
relf.time = c(14,24,12,25,20,14,17,18,22,29,36,20)
pain.data <- data.frame(trmt.type,relf.time) 

# creating plot 
ggplot(pain.data, aes(x = trmt.type, y = relf.time)) +
  geom_boxplot(fill = "grey80", color = "blue") +
  scale_x_discrete() + xlab("Treatment Type") +
  ylab("Relief time")
