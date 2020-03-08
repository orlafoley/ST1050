#Assignment 5


#Question 1 (2018-2019 Mid-term Exam Question 1)
#1. Read the file: flower.csv, which contains a famous flower dataset. 
    #Provide the R command you used as your answer here.
#2. If step 1 was not successful, please run flower=iris in R to get the dataset 
    #and then perform the following tasks. Create three subsets x1, x2 and x3 of the data, 
    #splitting it by Species so that these subsets contain all setosa, versicolor 
    #and virginica specimen respectively. 
    #Provide the R command you used as your answer here.
#3. Reproduce the below plot exactly (pay attention to every detail), 
    #for which were used (respectively by subset x1,x2,x3):
    #• histogram bin width of 0.25 units
    #• bold fonts everywhere
    #• color“darkgrey”,“cyan”and“navy” 
    #• density NULL, NULL and 10
#4. Save your plot as a .pdf file named flower histogram.pdf on your T drive.

setwd('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050/CSV files')
flower=read.csv('flower.csv')
#this is the iris dataset

x1=subset(flower,Species=='setosa')
x2=subset(flower,Species=='versicolor')
x3=subset(flower,Species=='virginica')
#data broken into 3 subsets depending on what type of flower it is

par(font=2,font.main=2,font.axis=2,font.lab=2)
#all fonts now bold
bin_width=seq(0,8,0.25)
??hist
hist(x1$Petal.Length, xlab='Petal Length (cm)', ylab='Frequency',
     main='Petal Length by Species', breaks=bin_width, col='darkgrey',
     xlim=c(0.5,7), ylim=c(0,35))
hist(x2$Petal.Length, add=T, col='cyan', 
     breaks=bin_width, density=NULL)
hist(x3$Petal.Length, add=T, col=NULL,
     border='navy', breaks=bin_width, density=10)
#adds each histogram onto the same chart
legend('topright',bty='n',fill=c('darkgrey','cyan','white'),
       border=c('darkgrey','cyan','navy'),legend=c('setosa','versicolor','virginica'))


setwd('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050/Assignments to GitHub')

pdf(file='flower histogram.pdf')

par(font=2,font.main=2,font.axis=2,font.lab=2)
bin_width=seq(0,8,0.25)

hist(x1$Petal.Length, xlab='Petal Length (cm)', ylab='Frequency', main='Petal Length by Species', breaks=bin_width, col='darkgrey', xlim=c(0.5,7), ylim=c(0,35))
hist(x2$Petal.Length, add=T, col='cyan', breaks=bin_width, density=NULL)
hist(x3$Petal.Length, add=T, col=NULL, border='navy', breaks=bin_width, density=10)

legend('topright',bty='n',fill=c('darkgrey','cyan','white'), border=c('darkgrey','cyan','navy'),legend=c('setosa','versicolor','virginica'))

dev.off()







#Question 2
#1. Write your own function (called “mymean”) to calculate the mean of a numeric vector. 
    #Then use rnorm(10) to generate 10 random normal numbers to test your function.
#2. Write your own function (called “mysd”) to calculate the standard deviation of a numeric vector. 
    #Then use rnorm(10) to generate 10 random normal numbers to test your function.
#3. write your own function (called “mysum”) to get the sum of a numeric vector. 
    #Then use rnorm(10) to generate 10 random normal numbers to test your function.

testnum=rnorm(10)

mymean=function(x) {
  return(sum(x)/length(x))
}

mymean(testnum)
mean(testnum)

mysd=function(x) {
  return(sqrt(sum((x - mean(x))^2) / (length(x)-1) ))
}

mysd(testnum)
sd(testnum)

mysum=function(x) {
  out=0
  for (i in 1:length(x)) {
    #iterate through each value input
    out=out+x[i]
  }
  return(out)
}

mysum(testnum)
sum(testnum)
