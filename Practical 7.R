#Practical 7 

#Correlation

#Correlation is usually defined as a measure of the 
#linear relationship between two quantitative variables 
#(eg. height and weight).
#When the values of one variable increase as the values
#of the other increase, this is know as positive correlation.
#When the values of one variable decrease as the values 
#of another increase to form an inverse relationship, 
#this is known as negative correlation.

#The most common measure of correlation is 
#Pearson’s product-moment correlation, which is commonly 
#referred to simply as the correlation, the correlation 
#coefficient or just the letter r.

#A correlation of 1 indicates a perfect positive correlation.
#A correlation of -1 indicates a perfect negative correlation.
#A correlation of 0 indicates that htere is no relationship 
#between the different variables.
#Values between -1 and 1 denote the strength of the correlation.
#A useful link: https://www.displayr.com/what-is-correlation/

#Example 1: Use the data ‘mtcars’ in R.
?mtcars
#Plot ‘mtcars$wt’ against ‘mtcars$mpg’. 
#How would you describe the relationship? 
#Do you think they are highly correlated?
plot(mtcars$wt,mtcars$mpg,main='WT against MPG')

#Do a qqplot of ‘mtcar$mpg’ to check for normality.
qqnorm(mtcars$mpg,ylab='MPG')

#Use the cor.test function and the pearson method 
#to check for the correlation between those 2 variables.
cor.test(mtcars$wt,mtcars$mpg,method='pearson')
#correlation is-0.8676594

#Example 2:
#Read in the dataset ‘fires.txt’ and name it ‘firedat’; 
#be sure to use header=T. The data is extracted from a 
#larger dataset of fires(per 1000 housing units) and 
#thefts (per 1000 units) in a small area of Chicago.

firedat=read.table('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050/CSV files/firedat.txt',
                   sep='',header=T)
?read.table # check arguments in this function

#It is easier to re-name the variables here so you 
#can avoid using the dataframe name for every command.
fires=firedat$fires
thefts=firedat$thefts

#Plot the data. We are interested in how the number of 
#thefts is related to the number of fires - so ‘fires’ 
#is the x-variable and ‘thefts’ is the y-variable.
plot(fires,thefts)

#There appears to be a linear trend. Check the covariance 
#and correlation. Using cor.test also check for whether 
#this correlation is significant. Reverse the variables 
#you entered into in cor.test - does it change anything?

cov(fires,thefts)
#40.33598
cor(fires,thefts)
#0.811255
cor.test(fires,thefts)
#correlation is 0.811255
cor.test(thefts,fires)
#correlation is 0.811255

#Linear Regression
#Using the function lm() to find a simple linear 
#regression model for how thefts are affected by fires. 
#It is convenient to name the regression model(say fit 1).
fit_1=lm(thefts~fires)
#Check the ouput of fit 1 by printing it to the screen 
#and then compare it to the ouput you get from summary(fit 1).

fit_1
#Call:
#lm(formula = thefts ~ fires)
#Coefficients:
#(Intercept) fires 4.098 3.729

summary(fit_1)
#Call:
#lm(formula = thefts ~ fires)
#Residuals:
#Min      1Q    Median    3Q  Max
#-14.354 -3.087 -1.127 2.027  29.881

#Coefficients:
#             Estimate Std.Error tvalue Pr(>|t|) 
# (Intercept)   4.0985  4.0925    1.001   0.326
# fires         3.7291  0.5271    7.075   1.63e-07 ***


#We want to predict what happens in a very bad year for 
#fires. At the moment our maximum number of fires is 
#12.2. What if there are 16 fires?

#Note: to do this, you will need a dataframe with your 
#values of interest - in this case the value is 16. It 
#is probably easier to set this dataframe before calling 
#the predict function. It is important that the value be 
#put into a dataframe - not just a vector and that it 
#refers to the vector name of interest from the model 
#(in this case - ‘fires’).

new=data.frame(fires=c(16))
predict(fit_1,new)
#63.76405

#Now check what happens for 17,19 and 22 fires. 
#Check these all at once (i.e. put all 3 into a dataframe).

new=data.frame(fires=c(17,19,22))
predict(fit_1,new)
#67.49315 
#74.95135 
#86.13865

#Plot fires against thefts again. This time add the 
#“line of best fit” into the plot using the abline() 
#function. Make it red with lwd=2.

plot(fires,thefts)
abline(fit_1,col=2,lwd=2)

#One sample t-test

#Suppose we have a random sample of people, 
#and we want to test whether the mean age of the 
#population (from which our sample is drawn) is 
#equal to 30. We will use the t.test() command in R 
#to perform a hypothesis test.
#Age data = 52, 22, 34, 56, 15, 20, 17, 44, 19, 35, 41, 36
#We must tell R
#The name of the variable containing the data
#The value we want to compare the mean of our variable to
age=c(52,22,34,56,15,20,17,44,19,35,41,36)
t.test(age,mu=30)
#mean of x: 32.58333
#p-value = 0.5355

#This procedure tests the null hypothesis that the 
#mean age (of the population) is equal to 30 years.
#The output provides the test statistic, degrees of 
#freedom, and p-value for the test, along with a 
#point estimate of the mean age, and a 95% 
#confidence interval for the mean age.

#In this case the estimated mean age is 32.58, which 
#is not significantly different from 30 
#(p-value = 0.54 > 0.05).


#Two Sample t-test

#Suppose we had a smaple of males and a sample 
#of females. Are the (population) mean ages the same 
#for males and females? Use the age data. The genders
#are given by:
gender=c('M','F','M','M','M','F','F','M','F','M','F','F')
male.age=age[gender=='M']
female.age=age[gender=='F']
t.test(male.age,female.age)
#p-value = 0.09887
#mean of x    mean of y
#39.33333     25.83333

#Null Hypothesis: Mean ages are same for males and 
#females p=0.09887>0.05, accept the null hypothesis.











