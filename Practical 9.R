#1 Practical 9 - ANOVA

#Read the data for ‘annual beer consumption per capita’ 
#in ‘beer.csv’. Use ‘region’ as your group. 
#Region 1,2,3= Europe, America and Asia.

data=read.csv('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050/CSV files/beer.csv')
region=data$region
beer=data$beer

#Do a boxplot of beer by group.
boxplot(beer~region,col=c(8,2,4),
        names=c('Europe','America','Asia'))


#Using the aov function get the probability that the 
#3 groups are the same. You’ll need to look at 
#summary(aov()) to see whether there are statistically 
#significant differences between the means of groups.

aov(beer~region)
#Call:
#aov(formula = beer ~ region)
#Terms:
#                 region      Residuals
#Sum of Squares   9055.935    2082.512
#Deg. of Freedom  1           34
#Residual standard error:   7.826261
#Estimated effects may be unbalanced

summary(aov(beer~region))
#           Df  Sum Sq  Mean Sq   F value   Pr(>F)
#region     1   9056    9056      147.9     6.24e-14 ***
#Residuals  34  2083    61

#NULL hypothesis: there is no statistically significant 
#difference between the means of groups. 
#p < 0.05, we need to reject the null hypothesis.

#Permutation Test

#Do a permutation test similar to one in class, and 
#create histogram and give p-value. Change the mean 
#in null.gp2 to 0.4. (Note: null.gp1 and null.gp2 are 
#from population with different means now)

# make up some 'true' data
set.seed(2)
# here we set groups with different means
null.gp1=rnorm(150)
null.gp2=rnorm(150,mean=0.4)
null.diff=mean(null.gp2)-mean(null.gp1) 
#get mean differences
#combine the two groups for the null and alt 
#in order to do the permutation test
null.all=c(null.gp1,null.gp2)
#all values in null
index=c(rep(1,150),rep(2,150)) 
#this will keep track of group
#function that we have written for getting the 
#result at each replication of the test.
perm.test <- function(x,y) {
  xstar<-sample(x) #sample(x) generates a random 
  #permutation of the elements of x
  mean(y[xstar==2]) - mean(y[xstar==1]) #uses the index 
  #vector to track group
}
#run permutation test
#the function replicate() does the specified 
#function as many times as requested
many.truenull = replicate(1000, perm.test(index,null.all ))
hist(many.truenull,xlim=c(-0.5,0.5))
abline(v=null.diff, lwd=2, col="purple")
mean(abs(many.truenull) > abs(null.diff)) #two sided

#2-sided p=0.001. 
#That means 1 of 1000 values larger in absolute value 
#than the absolute value of null.diff.
#In this case we could actually just do a t-test; 
#we can then compare the permutation test results 
#on the mean difference to the t-test results.

t.test(null.gp1,null.gp2)
#p-value = 0.0008588
#p < 0.005, we need to reject the null hypothesis. 
#The difference between the two populations means 
#is not equal to 0.


