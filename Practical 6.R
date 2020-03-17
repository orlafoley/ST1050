#Practical 6 - More on dataset,plots and loops
#Read dataset “airline” into R. The argument 
#“stringAsFactors” can ensure character variables are 
#not read as factors.
setwd('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050/Assignments to GitHub')
data1=read.csv(‘airline.csv’) 
data2=read.csv(‘airline.csv’,stringsAsFactors = FALSE) 
class(data1$TailNum) # check difference
class(data2$TailNum)

#Use the follwing command to set up R to send graphics 
#files to a pdf called Rplotxxx where xxx is the number
#of the plot you are putting out. The onefile=F argument 
#sends each graphics event to its own file (if onefile 
#is set to ‘T’ they all go into one large pdf.) 
#The pdf need to be written to your T drive. 
#Set your working directory to your T drive: 
#setwd(‘......\\T’) or setwd(‘..../T’)
> pdf(file='Rplot%03d.pdf',onefile=F) 
> hist(rnorm(10),main='graph1')
> hist(rnorm(10),main='graph2')
> hist(rnorm(10),main='graph3')
> dev.off()
#pdf 
#2

#Check what happens.

#For loop (con’d) Use different approaches to 
#capture the results of our loop in a vector or matrix. 
#We can create a null vector or matrix with specific 
#dimensions before a loop. Or create a null vector 
#and use cbind(),rbind() or c() function. For example:

x=rep(NA,6) # create a null vector with specific length
for(i in 1:6)
{
  x[i]=i^2
}
print(x)
#1 4 9 16 25 36

#or

y=NULL
for(i in 1:6)
{
   y=c(y,i^2)
}
print(y)
#1 4 9 16 25 36

#Another example:
x=matrix(NA,ncol=10,nrow=500)
for(i in 1:10)
{
  set.seed(1)
  x[,i]=rnorm(500)
}
View(x)

#or
y=NULL
for(i in 1:10)
{
  set.seed(1)
  y=cbind(y,rnorm(500)) 
}
View(y)

#Generate Random Numbers
#Generate vectors of length 1000 for: 
#Normal with mean 10 and sd=3

set.seed(1)
norms=rnorm(1000,10,3)
mean(norms)
#9.965056
sd(norms)
#3.104748

#Uniform from 1 to 10
set.seed(1)
uni=runif(1000,1,10)

#Poisson with lambda=15
set.seed(1)
pois<-rpois(1000,15)
mean(pois)
#14.784

#Binomial with 20 draws and p=0.25
set.seed(1)
binar=rbinom(1000,20,0.25)
mean(binar)
#5.019

#Put four histograms from these distributions on one page 
#with titles.
par(mfrow=c(2,2))
hist(norms,main=expression(paste("Normal Distribution,"
                                 ,mu,"=10,",sigma,"=3")))
hist(uni,main=expression(paste('Uniform Distribution,'
                               ,a,'=1,',b,'=10')))
hist(pois,main=expression(paste('Poisson Distribution,'
                                ,lambda,'=15')))
hist(binar,main=expression(paste('Binomial Distribution,'
                                 ,n,'=20,',p,'=0.25')))

#paste() function concatenates several strings together. 
#In other words, it creates a new string by joining the 
#given strings end to end. For example:
paste('Everybody','loves','statistics.')
#"Everybody loves statistics."
paste('Everybody','loves','statistics.',sep='-')
#"Everybody-loves-statistics."
paste('Everybody','loves','statistics.',sep='') 
#"Everybodylovesstatistics."

#Greek letters or symbols can be included in titles and 
#labels of a graph using the expression command.

#Normal Curve
#The graph of the normal distribution depends on two 
#factors - the mean and the standard deviation. 
#The mean of the distribution determines the location 
#of the center of the graph, and the standard deviation 
#determines the hieght and width of the graph. 
#All normal distributions look like a symmetric,
#bell-shaped curve.
#When the standard deviation is small, the curve is 
#tall and narrow; and when the standard deviation is big, 
#the curve is short and wide. For example:
x=seq(-10,10,by=0.1)
par(mfrow=c(2,1))
plot(x,dnorm(x,0,1),main='Smaller standard deviation(sd=1)')
plot(x,dnorm(x,0,3),main='Bigger standard deviation(sd=3)')

#Make 4 plots per page (2 rows and 2 columns). 
#Using the function dnorm, with a vector,x, 
#of values from -12 to 12 with jumps of 0.1, 
#find the normal curve for a mean of zero and sd’s 
#of 1,2,3 and 4. Use seq() to create the vector of 
#values from -12 to 12 by 0.1. Set the x-axis to the 
#x variable you created. Label the y axis as ’Density’.

par(mfrow=c(2,2))
x=seq(-12,12,by=0.1)
plot(x,dnorm(x,0,1),t='l',ylab='Density')
plot(x,dnorm(x,0,2),t='l',ylab='Density')
plot(x,dnorm(x,0,3),t='l',ylab='Density')
plot(x,dnorm(x,0,4),t='l',ylab='Density')

#pnorm() gives the probability of getting less than the 
#specified amount - to find the probability of a greater 
#value subtract from the sum of all possible values 
#which is 1.

#Example: What is the probability of seeing a value 
#that is either GREATER than 1.96 or LESS than -1.96 
#from a standard normal distribution(mean is 0, sd is 1) 
#of values? Round your answer to 2 digits. 
#Hint: use the pnorm() function to find the probability 
#of getting values less than -1.96; then use 1-pnorm() 
#to get the probability of a value greater than 1.96.

pnorm(-1.96,mean=0,sd=1)
#0.0249979

#or

pnorm(-1.96) #default argument: standard normal 
              #distribution(mean=0,sd=1)
#0.0249979
p1=pnorm(-1.96)
round(p1,2)
#0.02

#or

p2=1-pnorm(1.96)
round(p2,2)
#0.02

#or

p3=pnorm(1.96,lower.tail=FALSE)
round(p3,2)
#0.02

#Exercise 1: 
#Find the same for 2.576 or -2.576 and for 1.645 or -1.645
pnorm(2.576,mean=0,sd=1,lower.tail=FALSE)
#0.004997532
pnorm(1.645,mean=0,sd=1,lower.tail=FALSE)
#0.04998491

#To add a vertical/horizonal line to the plot use 
#the abline() function: e.g. abline(v=1.96,col=3) 
#or abline(h=1.96,col=2). h-horizonal; v-vertical.

#Example: Make a plot of the density for a normal 
#curve with mean 0 and sd of 1. On the curve, add a 
#blue vertical line at 1.645 and -1.645; add a green 
#vertical line at 1.96 and -1.96; and finally add a 
#red vertical line at 2.576 and -2.576.
par(mfrow=c(1,1))
plot(x,dnorm(x,0,1),t='l',ylab='Density')
abline(v=c(-1.645,1.645),col='blue')
abline(v=c(-1.96,1.96),col='green')
abline(v=c(-2.576,2.576),col='red')


#Exercise 2
#Assume that the test scores of a college entrance exam
#fits a normal distribution. Furthermore, the mean test 
#score is 72, and the standard deviation is 15.2. 
#What is the percentage of students scoring 84 or more 
#in the exam?
#Hint: use pnorm and read the help file for it - 
#you may want the argument lower.tail=FALSE
pnorm(84, mean = 72, sd = 15.2, lower.tail = F)
#0.2149176
#The percentage of student scoring 84 or more in the 
#college entrance exam is 21.5%

#Other distributions
#Suppose widgits produced at Acme Widgit works have 
#probability 0.005 of being defective. Suppose widgits 
#are shipped in randomly chosen carton contains exactly 
#one defective widgit? Question rephrased:
#What is P (X = 1) when X has the B(25,0.005) 
#distribution? use dbinom and read the help file
dbinom(1, 25, 0.005)
#0.1108317

#Exercise 3
#What are the 10th,20th and so forth up to 90th 
#quantiles of the B(10,1/3) distribution? 
#Hint: to get the 90th percentile use qbinom(0.9,10,1/3)
qbinom(seq(0.1,0.9,0.1),10,1/3)









