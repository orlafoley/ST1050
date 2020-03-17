#Practical 4 - Histograms/Graphs
#Create data for graphs - generate a sample of 50 
#with mean 0 and standard deviation 1. 
#This is the default - i.e. rnorm(50) is the same as rnorm(50,0,1)
set.seed(1)
v=rnorm(50,0,1)

#Create the histogram. Make the colour of the histogram yellow.
hist(v,col='yellow')
#Make a new histogram as follows: 
#Redo the above histogram with these changes - 
#Make the colour green, and give it a yellow border (using border=“yellow”). 
#Make the x limits: -5 to 5, and make the y limits 0 to 25.
#Put 5 breaks in the histogram using the breaks= argument.


hist(v,col="green",border="yellow",
     xlim=c(-5,5),ylim=c(0,25),breaks=5)

#You can also get the actual counts for 
#each breakpoint as follows:
hh=hist(v,breaks=5)
hh$counts

#Example 2
#Read the dataset “stations.csv” from the P drive
#and call the dataframe “data”. 
#These are temperatures from 4 weather stations. 
#Each Station has three separate readings 
#(so Stat 11 is Station 1’s first reading; 
#Stat 12 is the second reading there etc.) 
#Note: you need to choose right path
#(Supplementary 1). It may be 
#P:/ST1050/dataset/stations.csv

data=read.csv('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050/CSV files/stations.csv')
#Make a boxplot of the whole dataset.
boxplot(data)
#Are all the names appearing on the x-axis? 
#Sometimes there isn’t room to put all the 
#names horizontally, so add vertical names: 
#use the argument las=2 to make the x lables 
#vertical.
boxplot(data,las=2)
#Add space between days for clarity by specifying where 
#each boxplot is drawn. Use the at argument, and leave 
#out the number where you want spaces as is done here:
boxplot(data,las=2,at=c(1,2,3,4,6,7,8,9,11,12,13,14))
#there's a space after every 4 stations
#Add colour: colour each station differently - 
#but keep the same colour for all 3 readings at that station.
boxplot(data,las=2,at=c(1,2,3,4,6,7,8,9,11,12,13,14),
        col=rep(c(1:4),3))
#Exercise 1
#Using the “stations” data make a new boxplot that has the 
#weather stations grouped together, with space in between 
#each of them. i.e. There will be 4 groups on your boxplot-
#each group will have the three days of data for the one 
#station.
#So for Station 1, it will have 3 days grouped together - 
#Stat11, Stat12, and Stat13. Colour each weather station 
#a different colour (4 colour altogether).
#Hint: The easiest way to do this is probably to make a 
#new dataframe which has the columns in the correct order: 
#data2=cbind(data[,1],data[,5],.....) etc
data2=cbind(data[,1],data[,5], data[,9],data[,2],data[,6], 
            data[,10],data[,3],data[,7], data[,11],
            data[,4],data[,8],data[,12])

boxplot(data2,las=2,at=c(1,2,3,5,6,7,9,10,11,13,14,15),
        col=c(rep(1,3),rep(2,3),rep(3,3),rep(4,3)),
        names=c('Stat11','Stat12','Stat13','Stat21',
                'Stat22','Stat23','Stat31','Stat32',
                'Stat33','Stat41','Stat42','Stat43'))

#Example 2
#Read in the data “airquality.csv” from the ST1050 folder 
#and name it “air”.
air=read.csv('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050/CSV files/airquality.csv')
#Make the following variables from the dataset:
Ozone=air$Ozone
Solar.R=air$Solar.R
Wind=air$Wind
Temp=air$Temp
Month=air$Month
#Make a new temperature variable TempC 
#which is the Temp variable in degree Celsius: 
#(Self-learning: round() function)
TempC=round((5/9)*(Temp-32),1)
#converts F to C
?round
#We are going to make a “categorical” variable called 
#tempcat from TempC - a categorical variable has values 
#that are labels instead of numbers. In this case we want 
#to make two groups named “<25” and “>=25”.
tempcat=TempC
tempcat[TempC<25]='<25'
tempcat[TempC>=25]='>=25'


#Exercise 3
#Convert the variable tempacat to a factor. (as.factor())
tempcat=as.factor(tempcat)
#as.something() changes the variable to another data type

#Use the sort() function to sort Ozone values for each 
#of the two levels of tempcat.
sort(Ozone[tempcat=='<25'])
sort(Ozone[tempcat=='>=25'])

#Plot a histogram of Ozone for the days that are <25.
hist(Ozone[tempcat=='<25'])















