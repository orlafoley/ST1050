#Practical 10 2019/11/15 - Paired Permutation Test

#Exercise: Paired Permutation Test

#Read in the data from P:/ST1050/Dataset/twins.txt 
#(you will need to use ’read.table’). 
#Calculate a permutation test for the paired data 
#and create histogram with details exactly as was
#done in class.

setwd('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050/CSV files')
twins=read.table('twins.txt')
null.gp1=twins$t1
null.gp2=twins$t2
null.diff=mean(null.gp2)-mean(null.gp1) 
#get mean differences
#combine the two groups for the null and alt 
#in order to do the permutation test
null.all=c(null.gp1,null.gp2)
#all values in null
index=c(rep(1,10),rep(2,10)) 
#this will keep track of group
#function that we have written for getting the 
#result at each replication of the test.
perm.test <- function(x,y) {
  xstar<-sample(x) #sample(x) generates a random 
  #permutation of the elements of x
  mean(y[xstar==2]) - mean(y[xstar==1]) #uses the index 
  #vector to track group
}
many.truenull = replicate(1000, perm.test(index, null.all))
hist(many.truenull, xlim=c(-1,1))
abline(h=null.diff, lwd=2, col="purple")
mean(abs(many.truenull) > abs(null.diff)) 
#0.13

#Note: The dataset shows the IQs of ten paris of 
#twins who were raised apart. In each pair, 
#one twin had been raised in a ‘good’ environment 
#and another in a ‘poor’ environment. The question is
#whether environment plays an impact on IQ; 
#the twins are treated as pairs.

#Population and Sample
#Step 1: Plot Population and Sample
#Plot population: normal distribution with mean(mu=1.5) 
#and standard deviation(sd=0.5)
#Create a sample of n=200 data points from population
#Question: In the plot with the title “Population+Sample’, 
#what is the red curve plotting? The density curve 
#for the population

par(mfrow=c(2,2))
set.seed(1)
# Plot population nomral distribution with 
#mean(mu=1.5) and standard deviation(sd=0.5)
mu = 1.5
sd = 0.5
u = seq(-3,3,.01)
x = mu+sd*u
fx = dnorm(x,mu,sd)
plot(x,fx,main=expression(paste('Normal Population(',mu,'=1.5,','sd=3)')),
     xlab="x", ylab="Density")
# Sample of n=200 data points from population
n=200
y = rnorm(n,mu,sd)
hist(y,freq=FALSE,main="Sample Data")
# Plot Population and Sample together
o=hist(y,freq=F) # record results to control 'ylim'
hist(y, freq=F, main="Population + Sample",
     ylim=range(fx,o$density))
lines(x,fx,col=2)

#Step 2: qq-plot comparison between Population
#Density and Histogram
#Data quantiles y1 < y2 < .... < yn [ordered ydata values]
#Population quantiles (100(i+0.5))/(n+1) for i = 1, 2, ..., n quantiles
#Question 1: In the plot title ‘Normal Q-Q plot’, 
#what are we checking for? Checking for normality
#Question 2: In the plot title ‘Normal Q-Q plot’, 
#why did we show the blue line? To demonstrate 
#how close/far the relationship is to linear
#Question 3: What are we trying to demonstrate in plot 1?
#In this case we care comparing two normals so they 
#are exactly linear. The mu and sd don’t affect this.

par(mfrow=c(2,2))
squant = sort(y)
ps = ((1:n)+.5)/(n+1);
pquant=qnorm(ps,mu,sd)
pquant01=qnorm(ps,0,1)
# plot 1
plot(pquant01,pquant,ylab="Quantiles Normal: mu,sd ",
     xlab="Quantiles Normal: 0, 1")
abline(a=mu,b=sd,col=4,lwd=2)
# plot 2
plot(pquant01,squant,xlab="Population",ylab="Data",
     main="Direct Normal QQ Plot")
# plot 3
qqnorm(y)
abline(lm(squant~pquant01)$coef,col=4)
# plot 4
hist(y, freq=F, main=" Population + Sample",
     ylim=range(fx,o$density))
lines(x, fx, col=2)

#The mean of the sampling distribution of the mean is
#the mean of the population.
#The variance of the sampling distribution of the mean 
#is the population variance divided by the sample size(N).
#The larger the sample size, the smaller the variance of 
#the sampling distribution of the mean
#(Assignment 6/Exam Paper Q2).
#Central limit theorem(CLT): Averages will have an 
#approximate Normal sampling distribution. For more 
#details, a good explanation is in: 
#http://sphweb.bumc.bu.edu/otlt/MPH−Modules/BS/BS704Probability/BS704Probability12.html
#Also you will learn it in ST1051/ST2054/ST3061

#Step 3: Statistics comparison population and sample
#If n values are sampled from a population data {y1,y2...yn} 
#and we compute a statistic - e.g. the sample average y ̄
#Question: How will y ̄ vary if a different set of n values
#were sampled?

# Data coming from a Normal population
par(mfrow=c(1,3))
mu=3 
sd=.5
# Draw a very large sample as population
yy=rnorm(1000000,mu,sd)
popmean=mean(yy)
popsd=sd(yy) 
# population mean and sd
hist(yy,main="Population")
print(round(c(mu,popmean,sd,popsd),2))
#3.0 3.0 0.5 0.5
ns=500
n =20
mu=popmean
sd=popsd
ybars=NULL
for(s in (1:ns))
{
  y=rnorm(n,mu,sd) # sample size is n
  ybar=mean(y) # compute smaple mean
  ybars = c(ybars,ybar) # record sample mean
}
hist(ybars,freq=F)
sy=sort(ybars)
lines(sy, dnorm(sy, mu, sd/sqrt(n))) 
#Add Theory line: ybar~N(mu,sd/sqrt(n)) 
qqnorm(ybars)
#Theoretical Result:sample mean is normal with 
#same mean and standard deviation = sd/sqrt(n)

















