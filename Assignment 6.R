#ST1050 Assignment 6 

#Question 1 (2018-2019 Exam Question 2)
#Please use set.seed(1) before running your R code.
#1. Compute values of the sample means of 1000 samples of size N=10 
    #from the Normal distribution with mean=1 and sd=2. Store these 1000 values in a vector. 
    #Repeat this process for other batches of 1000 samples of size N, 
    #where N is successively in (20,30,40...,100). Store the full dataset, including the N=10 values, 
    #in a matrix with 1000 rows and 10 columns.


set.seed(1) 
M=1000
N=10
all_N = seq(10,100,by=10)
my_matrix = matrix(NA,nrow=M,ncol=N)
for(i in 1:N){
  n = all_N[i]
  for(j in 1:M){
    x = rnorm(n=n,mean=1,sd=2)
    my_matrix[j,i] = mean(x)
  } 
}
#nested for loop to get through values quicker
#matrix now filled with those random numbers

#2. Use the dataset in (a) to generate a single plot showing boxplots of the 
    #sample mean values as a function of the sample size N.


boxplot(my_matrix, names=all_N, pch=20, col=8, xlab='Sample size')



#3. For each N, compute the variance of the sample of 1000 mean values. 
    #Plot the reciprocal of these variances as a function of a sample size. 
    #Based on the data, propose a theoretical formula for the variance of the 
    #sample mean as a function of the sample size and the population variance. 
    #Add a line on your plot to show your proposed theoretical formula.




Sample_var=apply(my_matrix,2,var)
#find variance of columns
plot(all_N,1/Sample_var,xlab="Sample Size",ylab="1/Variance",pch=16) 
sd=2
#see sd from above
lines(xlabels, xlabels/sd^2, col=2)





#Question 2
#1. Calculate the probability that a man is shorter than 66 inches, 
    #assuming that men’s heights are normally distributed with a mean 
    #of 70 inches and a standard deviation of 3 inches.

pnorm(66,mean=70,sd=3)

#2. Recall: Given a probability p and a distribution, 
    #you want to determine the corresponding quantile for p: 
    #the value x such that P (X ≤ x) = p. qnorm is the quantile 
    #function for the Normal distribution.
    #Find a positive number z so that the area under the standard 
    #normal curve between -z and z is 0.95.

qnorm(0.975)
#2.5 on one side, 2.5 on the other

#3. Draw the well-known bell curve of 
    #standard normal distribution.

x=seq(-4,4,0.1)
plot(x,dnorm(x),type='l')

#4. Calculate the probability of getting 25 or 
    #less heads from a 52 tosses of a coin.

pbinom(25,52,0.5)
#50% chance getting either H or T
#Binomial - success or failure