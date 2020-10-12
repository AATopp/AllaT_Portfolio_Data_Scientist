# Alla Topp
# one sample sign test and Wilcox test

# problem 1 
library(BSDA)
a <- c(5,3,2,1,4,3,5,1,5,2,3,4,2,1,3) # numeric vector of data values. 
SIGN.test(a, mu = 3, conf.level = 0.95, alternative = "greater") # one sample sign test 

# problem 2  
m <- c(9,8,5,3,6,10,4,2,8,7) # numeric vector with rates of M operating system
w <- c(7,6,8,2,9,5,1,4,7,10) # rates of W operating system 
wilcox.test(m, w, mu = 0, paired=TRUE, exact = FALSE, conf.int=TRUE) # computes wilcox test

