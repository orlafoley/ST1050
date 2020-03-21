#Practical 12 - Bootstrap

#If the population structure is unknown, it is 
#possible to use the Bootstrap device to 
#approximate the sampling distribution of 
#statistics.

#The idea is to treat the sample data as 
#the population distribution (histogram) 
#and sample from that ‘bootstrapped population’ 
#to simulate sampling from the true population.

#Now we use Bootstrap method to approximate 
#the sampling distribution of the sample mean 
#and standard deviation.

set.seed(1)
par(mfrow=c(1,2))

# Step 1: Calculate a very large sample which 
#is like a 'population':
# Suppose the true is normal distribution 
#with mean 2 and sd 1

yy=rnorm(1000,mean=2,sd=1)
syy=sort(yy)
hist(yy,freq=F,main='Population')
lines(syy,dnorm(syy,mean=2,sd=1))

# Step 2: Calculate a small sample which is 
#like the type of sample you might get in an 
#experiment: A sample of size 100 is taken
#and the mean and standard deviation is 
#calculated

n=100
y=sample(yy,n,replace=T)
hist(y,main='Sample')
ymean=mean(y)
ysd=sd(y)

#Step 3: Now we first look at the type of 
#samples we might find
#from the true population:
#A. TRUE SAMPLING DISTRIBUTION of sample mean and 
#sd from normal

NS=10000; ymeansT=NULL; ysdsT=NULL

for(s in 1:NS) {
  ys=sample(yy,n,replace=T)
  ymeansT=c(ymeansT,mean(ys))
  ysdsT=c(ysdsT,sd(ys))
}

#Step 4: then we first look at the type of 
#samples we might find if we use our smaller 
#dataset.
#B. BOOTSTRAP SAMPLING DISTRIBUTION of 
#sample mean and sd from normal

NB=700; ymeansB=NULL; ysdsB=NULL

for(b in 1:NB) {
  yb=sample(y,n,replace=T)
  ymeansB=c(ymeansB,mean(yb))
  ysdsB=c(ysdsB,sd(yb))
}

#Step 5: Comparison

par(mfrow=c(2,3))
hist(ymeansT,xlab="mean",main="True")
print(round(c(mean(ymeansT),sd(ymeansT)),3))
#1.990 0.104

hist(ymeansB,xlab="mean",main="Bootstrap")
print(round(c(mean(ymeansB),sd(ymeansB)),3))
#1.994 0.112

qqplot(ymeansT,ymeansB,main="qq-plot",xlab="TRUE-quantiles",ylab="Boot-quantiles") > hist(ysdsT,xlab="mean",main="True")
print(round(c(mean(ysdsT),sd(ysdsT)),3))
#1.032 0.073

hist(ysdsB,xlab="mean",main="Bootstrap")
print(round(c(mean(ysdsB),sd(ysdsB)),3))
#1.126 0.094

qqplot(ysdsT,ysdsB,main="qq-plot",xlab="TRUE-quantiles",ylab="Boot-quantiles")

#We can see that even though we start with a 
#small sample (from step 2) to calculate the 
#sampling distribution(step 4). We end up with 
#something reasonably close to the sampling 
#distribution in Step 3 (which is based on 
#the ’true’ population.)

#Bootstrap procedure works well if the 
#sample data is representative of the true 
#population[works better with larger samples].




