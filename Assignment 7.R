#ST1050 Assignment 7

#Question 1 (2018-2019 Mid-term Exam Question 2)
#We consider R’s crabs dataset, and analyse crab carapace width by crab species.


#1. Quote the respective sample mean carapace widths for these two species.

library(MASS)
#need to import another library to access dataset
crabs
#cols are species, sex, index, FL, CL, CW = carapace widths, BD
mean(crabs$CW[crabs$sp=='B'])
mean(crabs$CW[crabs$sp=='O'])
#means are 34.717 and 38.112 respectively



#2. Produce a single-frame plot comparing the boxplots of carapace 
    #width distributions per species.

#boxplot time!
boxplot(CW~sp, crabs, col=c('blue', 'orange'), #aesthetic
        main = 'Carapace Width (mm)')


#3. Perform a statistical test for the comparison of mean carapace width 
    #between these two species. Quote the p-value of the test. 
    #Interpret this output.

#need to perform a t test
t.test(CW~sp, crabs)
#p-value = 0.002109
#Outcome is significant in this test
#This means there is a difference between these 2 groups







#Question 2: Distributions
#1. Assumes that the test scores of a college entrance exam fits a normal distribution. 
    #Furthermore, the mean test score is 55, and the standard deviation is 26.8. 
    #What is the percentage of students scoring 84 or more in the exam?

1 - pnorm(84, mean = 55, sd = 26)
#Should be 0.1323428 of the class - about 13%

#2. what is P(X = 1) when X has the B(30, 0.005) distribution?

#binomial dist
dbinom(x = 1, size = 30, prob = 0.005)
#Ans = 0.1297062


#3. set a seed: set.seed(1050) and generate 100 random numbers from standard normal distribution. 
    #Summary them and get 1 sample with 10 values. For this sample, if its value is 
    #greater than the mean value of all elements? values, set its value to 1, otherwise set to 0. 
    #Use ifelse function to achieve this.

set.seed(1050)
qu3 = rnorm(100)
summary(qu3)
samp=sample(x = qu3, size = 10, replace = T)
checking =ifelse(test = samp>mean(samp), yes = 1, no = 0)
checking
#comes out 0 1 0 0 1 0 1 1 1 1

