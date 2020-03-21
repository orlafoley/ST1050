#Practical 11(Review) 2019/11/19(Week 11)
#If you want to know more details about a specific function, 
#just search keywords in Practical Handbook. 
#Shortcut key to search: ctrl+F.
#read.csv setwd() ctrl+F, 
#press shift + right click table apply subset 
#na.rm=T cbind rbind hist, boxplot arrow par text


#Import Data and R Basic Functions

#To read from R, you need to have a firm grasp of where 
#in the computer’s filesystem you are reading from.
#That means you need to set your current working 
#directory(setwd(‘directory path’)).

#We use forward slashes (/) or double backslashes (\\), 
#in the directory path. 

#For example, both “setwd(‘C:/R’)” and “setwd(‘C:\\R’)” 
#refer to the R directory on the ‘C’ drive.

#Shortcut key to find file path: 
#Right-click the file-Properties-Location.

#Shortcut key to find file path with file name: 
#Press shift key + right click, then ‘copy path’.

#Tables of data can be read in with the read.table() function.
#The extra argument header=TRUE says that a header includes 
#information for the column names. 
#For example, read.table(“data.txt”,header=TRUE).

#The function read.csv() will perform a similar task, 
#only on csv files.The argument stringAsFactors can 
#ensure character variables are not read as factors.

#Note: read.table() and read.csv() return a data frame 
#storing the data. 




#Exercise
#Set the current working directory to 
#P drive-ST1050-Dataset folder.
setwd('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050/CSV files')

#Read in the airline.csv file, ensuring character 
#variables are not read as factors.
read.csv('airline.csv', stringsAsFactors = F)

#Read in the twins.txt file.
read.table('twins.txt')

#Read in the airquality.csv file.
airquality=read.csv('airquality.csv')

#How many variables and observations in the 
#dataset-airquality? dim()/nrow()/ncol()
dim(airquality)

#What are the column names for this 
#dataset? names()/rownames()/colnames()
names(airquality)

#Extract the ’Ozone’ variable in this dataset 
#and what is the mean for this variable. $ or [,]
ozone=airquality$Ozone
mean(ozone, na.rm = T)

#Provide a table showing the distribution of 
#‘Month’. table()
table(airquality$Month)

#Extract the first ten rows in this dataset.
head(airquality,10)

#Extract the two subsets of airquality comprising 
#‘set1’: temperature(Temp) below or equal to 75, 
#and ‘set2’: temperature above 75. subset()/which()
question = airquality$Temp
set1 = airquality$Temp[question<=75]
set2 = airquality$Temp[question>75]

#Extract the subset: Month=5 and Temp=61 of airquality.
first = subset(airquality, Month == 5)
second = subset(first, Temp == 61)

#Make a new temperature variable TempC which is the 
#Temp variable in degree Celsius and round it
#to 1 digit.
TempC = (5/9)*(airquality$Temp - 32)

#Make a ‘categorical’ variable called tempcat from TempC - 
#a categorical variable has values that are labels instead
#of numbers. In this case we want to make two groups named 
#‘<25’ and ‘>=25’.
tempcat = TempC
airquality$Temp[tempcat<25]
airquality$Temp[tempcat>=25]

#Convert the variable TempC to a factor.
TempC = as.factor(TempC)

#Data visulization
#Plotting commands are divided into two groups:

#High-level plotting functions create a new plot 
#on the graphics device like scatter plot, histogram 
#and boxplot, possibly with colours, line types, axes, 
#labels and titles specified(Page 49,53 and 54 in lecture 
#slides). plot(),hist() and boxplot()
set.seed(1050)
data = rnorm(1000, mean = 0, sd = 1)
hist(data, freq = F)

#Low-level plotting functions and more information 
#to an existing plot, such as extra points, lines and 
#labels(Page 69 lecture slides). points(),lines(),
#abline(), arrow(), text() and legend()
den = seq(-4,4, by = 0.1)
lines(den, dnorm(den, mean = 0, sd = 1), col = 'red')

#Par() can set graphics parameters and create 
#multiple figure environment. (Lecture Slides 
#Page 70 and 71)
par(mfrow = c(1,2))

set.seed(1050)
data = rnorm(1000, mean = 0, sd = 1)
hist(data, freq = F)
den = seq(-4,4, by = 0.1)
lines(den, dnorm(den, mean = 0, sd = 1), col = 'red')

set.seed(1050)
udata = runif(1000, 10, 20)
hist(udata, freq = F)
uden = seq(10,20, by = 0.1)
lines(uden, dunif(uden, 10, 20), col = 'olivedrab')
#Writing Plot to a file. pdf(‘....pdf’) 
#..... dev.off()

pdf('11.pdf')

par(mfrow = c(1,2))

set.seed(1050)
data = rnorm(1000, mean = 0, sd = 1)
hist(data, freq = F)
den = seq(-4,4, by = 0.1)
lines(den, dnorm(den, mean = 0, sd = 1), col = 'red')

set.seed(1050)
udata = runif(1000, 10, 20)
hist(udata, freq = F)
uden = seq(10,20, by = 0.1)
lines(uden, dunif(uden, 10, 20), col = 'olivedrab')

dev.off()

#Exercise

#Plot a histogram of Ozone for the temperature that are <25. 
#grey boxes,bold fonts everywhere. Add title 
#’Ozone by Temperature’, set approximate x and y limits 
#and x label-‘Ozone’. 
par(mfrow = c(1,1), font = 2)
hist(airquality$Temp[tempcat<25], 
     main = 'Ozone by Temperature', xlab = 'Ozone',
     col='grey')

#Add a histogram to that plot of Ozone for the temperature 
#that are >=25.density 10.

#Add a corresponding legend.

#Do a boxplot of Ozone level by tempcat, 
#colour the cool temperatures blue and warmer
#temperatures red. Add the title “Ozone by 
#Temperature(Celsius)”.

#Save these plots to one pdf file called “Review1.pdf” 
#on your T drive. Linear Regression

setwd('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050')
pdf('Review1.pdf')

par(font.axis=2,font.main=2,font.lab=2)

hist(Ozone[tempcat=='<25'],col = 'grey',
     main = 'Ozone by Temperature', xlab = 'Ozone',
     xlim=c(0,200), ylim=c(0,20))

hist(Ozone[tempcat=='>=25'],add=T,
     density = c(10),col='cadetblue')

legend('topright',paste(levels(tempcat)),density = c(NA,10),
       col=c(grey,cadetblue),angle=45,
       fill=c('grey','cadetblue'))

boxplot(Ozone~tempcat,main='Ozone by Temperature(Celsius)',
        col=c('deepskyblue','coral'),xlab='Temp (C)')

dev.off()

#Compare and comment briefly on the correlations 
#between Wind and Ozone on one hand, and between 
#Temp and Ozone on the other hand.
cor(Wind,Ozone,use='complete.obs')
#-0.6015465
cor(Temp,Ozone,use = 'complete.obs')
#0.6983603

#Plot the relationship between temperature and ozone 
#and add (using lm()) the “line of best fit”, in red 
#with a line width of 2, through this cloud of points. 
#Please use “pch=20” when plotting the data points.
plot(Temp,Ozone,pch=20)

#Quote the regressions estimates and give this 
#linear model.

#Comments
#Ozone is negatively aligned with wind speed
#and slightly more positively aligned with
#with temperature
plot(Temp,Ozone,pch=20)
abline(lm(Ozone~Temp),col=2,lwd=2)
lm1=lm(Ozone~Temp)
lm1
#(Intercept)         Temp  
#-146.995           2.429  
#intercept = -146.995
#slope = 2.429
#linear model is
#Ozone = 2.429*Temp - 146.995

#Predict the ozone level when the temperature 
#is 75 degrees. predict
predict(lm1,data.frame(Temp=75))

#Loops and Distributions
#Please use set.seed(1) before running your R code.
#1. Generate ten samples of 500 random realizations 
#from the Normal distribution with mean=2 and
#sd=1,2,3...10 separately. Store these values in a matrix 
#called “M”. cbind()
M=NULL
for (i in 1:10) {
  M=cbind(M,rnorm(500,2,i))
}

#Compute the mean and variance for each column. 
#What are the theoretical mean and variance
#for each column? apply()/colMeans() 
colMeans(M)
apply(M,2,mean)
apply(M,2,var)

#2. 2018-2019 Exam Paper Q2
#Compute values of the sample means of 1000 samples 
#of size N=10 from the Normal distribution with mean 1 
#and sd=2. Store these 1000 values in a vector. 
#Repeat this process for other batches of 1000 
#samples of size N, where N is succesively 
#in (20,30,40,...100). Store the full dataset, 
#including the N=10 values, in a matrix with 1000 rows 
#and 10 columns.
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

#For each N, compute the variance of the sample of 
#1000 means. Plot the reciprocal of these variances 
#as a function of sample size. Based on the data, 
#propose a theoretical formula for the variance of the 
#sample mean as a function of the sample size and the 
#population variance. Add a line on your plot to show 
#your proposed theoretical formula.
Sample_var=apply(my_matrix,2,var)
plot(all_N,1/Sample_var,xlab="Sample Size",ylab="1/Variance",pch=16) 
sd=2
lines(all_N, all_N/sd^2, col=2)

#What is the probability of seeing a value that is 
#either GREATER than 1.96 or LESS than -1.96. 
#Round your answer to 3 digits.
a = pnorm(1.96, 0, 1, lower.tail = F)
round(a, digits = 3)
#0.025

#3. Plot the normal curve with mean 1 and sd 3. Using the 
#function dnorm(), with a vector, x, of values from 
#-10 to 10 with jumps of 0.1. Add a vertical line (v=1).
#from a standard normal distribution. 
set.seed(420)
x = seq(-10, 10, by = 0.1)
num = rnorm(1000, mean = 1, sd = 3)
plot(num, dnorm(num, 1, 3))
lines(x, dnorm(x, mean = 1, sd = 3), col = 'blue')
abline(v = 1, col = 'red')

#What is the 85th quantile of the normal distribution 
#with mean 2 and variance 9.
#sd = root variance
qnorm(0.85, mean = 2, sd = 3)
#5.1093

#Find a positive number z so that the area under the 
#standard normal curve between -z and z is 0.95.

#if area is 0.95
#1-0.95=0.05
#therefore 0.025 on either side
pnorm(0.025, mean = 0, sd = 1) 
# z = 0.1647801

#set a seed: set.seed(1050) and generate 100 random 
#numbers from standard normal distribution. Summary 
#them and get 1 sample with 10 values. For this sample, 
#if its value is greater than the mean value of all 
#elements? values, set its value to 1, otherwise set to 0. 
#Use ifelse function to achieve this. ifelse()

set.seed(1050)
lastqu = rnorm(100)
ifelse(lastqu>mean(lastqu), 1, 0)






