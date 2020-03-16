#Practical 3 - Factors

#Factors are used to represent categorical data. 
#Factors can be ordered or unordered and are an important 
#class for statistical analysis and for plotting.
#The factor() command is used to create and modify factors in R. 

#For example
#R will assign 1 to the level “female” and 2 to the level “male” 
#(because ‘f’comes before ‘m’,even though the first element in this vector is ‘male’).
sex<-factor(c('male','female','female','male'))
sex
#male   female   female  male
#Levels: female male

#Sometimes, the order of the factors does not matter, 
#other times you might want to specify the order because it is meaningful 
#(e.g. “low”,“medium”,“high”) or it is required by particular type of analysis.
#Additionally, specifying the order of the levels allows us to compare levels:
#Now reassign the levels of food:
#Although we have created an order here the factor is unaware of it: 
#e.g. min(food) doesn’t work. But we can tell the factor that the 
#levels are ordered by using the additional argument “ordered”:

food <- factor(c("low","high","medium","high","low","medium","high")) 
levels(food)
#"high"   "low"    "medium"
#ordered alphabetically

food <- factor(food,levels=c('low','medium','high')) 
levels(food)
#"low"    "medium" "high"

food<-factor(food,levels=c("low",'medium','high'),ordered=TRUE) 
min(food)
#low
#Levels: low < medium < high

#Getting information for each level of a factor can often be of interest. 
#tapply(var,fac,func) applies function “func” to all elements of “var”, 
#grouped by “fac”. For example:

a<-c(1,2,3,4,5,6,7,8,9)
f<-factor(c('a','a','a','b','b','b','c','c','c')) 
tapply(a,f,mean)
#a  b c 
#2  5 8


#Exercise 1
#1. Create a factor called “sizes” from this vector: 
  #c(“small”,“large”,“large”,“small”,“medium”)

sizes=factor(c('small','large','large','small','medium'))
sizes
#small  large  large  small  medium
#Levels: large medium small

#2. Get the levels of “sizes”
levels(sizes)
#"large"  "medium" "small"

#3. Now reorganize the factor so that the levels are 
  #“small”,“medium”,“large” and give it an order.


sizes = factor(c('small','large','large','small','medium'),
               levels=c('small','medium','large'),ordered=T) 
sizes
#small  large  large  small  medium
#Levels: small < medium < large

#4. Get the maximum levels of “sizes”
max(sizes)
#large
#Levels: small < medium < large

#5. Use tapply to get the mean of the vector sz=c(2,7,9,3,5) 
#by factor levels of “sizes” > sz=c(2,7,9,3,5)
sz=c(2,7,9,3,5) 
tapply(sz,sizes,mean)
#small medium large 
#2.5    5.0   8.0

#List
#You can construct a list from its components with the function list. 
#It can contain elements of different types and lengths. 
#Here is an extreme example of a mongrel created from a scalar, 
#a character string, a vector and a function:
lst <- list(3.14,'Moe',c(1,1,2,3),mean)

#When R prints the list, it identifies each list element by its position 
#([[1]],[[2]],[[3]],[[4]]) and prints the element’s value under its position.
lst
#[[1]] 
#3.14
#[[2]]
#"Moe"
#[[3]]
#1 1 2 3
#[[4]]
#function (x, ...) UseMethod("mean")
#<bytecode: 0x7f93cbcffb88> <environment: namespace:base>

#You can access the elements in a list using double square brackets [[ ]]. 
#If you just use square bracket [ ], you will get a list not element.
lst[1]
#[[1]]
#3.14
lst[[1]]
#3.14
class(lst[1])
#"list"
class(lst[[1]])
#"numeric"


#Exercise 2
#1. Set a vector of 5 elements (5,6,’7’,’a’,TRUE) using list function
lst1 <- list(5,6,'7','a',TRUE) 
lst1
#[[1]] 
#5
#[[2]] 
#6
#[[3]] 
#"7"
#[[4]] 
#"a"
#[[5]]
#TRUE

#2. Get the real type of the third element in that list
class(lst1[[3]])
#"character"

#Dataframe
#A data frame is used for storing data tables. 
#It is a list of vectors of equal length but it can include 
#different types of data. For example, the following variable 
#“df” is a data frame containing three vectors n,s,b.
n=c(2,3,5)
s=c('aa','bb','cc')
b=c(TRUE,FALSE,FALSE) 
df=data.frame(n,s,b) 
print(df)
#  n  s   b 
#1 2 aa TRUE 
#2 3 bb FALSE 
#3 5 cc FALSE

#Accessing a data frame using [ ] or $
df$n
#2 3 5
df[,1]
#2 3 5
df[1,]
#   n   s   b 
#1  2 aa TRUE

#R built-in dataset
#R contains some built-in data sets. 
#Typing the data set name will reference the values. 
#A data set can store a single variable or several variables. 
#Usually, data sets that store several variables are stored as data frames. 
#This format combines many variables in a rectangular grid, 
#like a spreadsheet, where each column is a different variable, 
#and usually each row corresponds to the same subject or 
#experimental unit. This conveniently allows us to have all 
#the data vectors together in one object. For example, 
#the airquality data set records daily air quality measurements in New York, 
#May to September 1973.

summary(airquality)
#shows min/max, no of NA values, mean, median, 1st/3rd quartiles
#col names are Ozone, Solar.R, Wind, Temp, Month, Day
class(airquality)
#"data.frame"
dim(airquality)
#153 6
names(airquality)
#"Ozone" "Solar.R" "Wind"  "Temp"    "Month"   "Day"

#The different variables of a data frame typically have names, 
#but initially these names are not directly accessible as variables. 
#We can access the values by name, but we must also 
#include the name of the data frame. The $ syntax can be used to do this.

airquality$Ozone
#the ozone column of airquality
airquality[,1]
#column 1
#these give the same figures

#A convenient method, which requires little typing, 
#is to “attach” a data frame to the current environment 
#with the attach() function, so that the column names are 
#visible. Attached data sets are detached with the function detach().


attach(airquality)
Ozone
detach(airquality)

#Subset
#Sometimes we need to extract parts of a data set, 
#which() and subset() function are useful.

attach(airquality)
airquality[which(Month==5),]
subset(airquality,Month==5)
#picks out parts of the data frame which meet the condition of Month is 5

subset(airquality,Month==5 &Temp==61)
#picks out parts of the data frame which meet the conditions 
#of Month is 5 and Temp is 61

#Missing values
#NA represents a missing value. 
#For example, “vec” is a vector including the missing value
vec<-c(1,2,3,4,NA) 
vec
#1 2 3 4 NA

#How to remove the NA in vec? na.omit() function
na.omit(vec)
#1 2 3 4 
#attr(,"na.action")
#5 attr(,"class")
#"omit"

#Many R functions have an argument na.rm=, 
#which can be set to be TRUE in order to remove NAs.

mean(vec)
#NA
mean(vec,na.rm=TRUE)
#2.5
#mean of vector once we remove the NA value

#Try to set the missing value to 5 in vec. 
#Note: a semicolon (;) allows you to place numerous commands on one line

vec[vec=='NA'] <- 5; vec 
#1 2 3 4 NA
vec[vec==NA] <- 5; vec 
#1 2 3 4 NA
#haha nope!

#How to access the NA? The command - is.na()
is.na(vec)
#FALSE FALSE FALSE FALSE  TRUE
vec[is.na(vec)]<-5;vec
#1 2 3 4 5
#It works now!!!


#Exercise 3
#Using the R dataset “airquality”
#1. Extract the two subsets of airquality comprising of “set1”: 
    #temperature(Temp) below or equal to 75, and “set2”: temperature above 75.
attach(airquality)
set1=subset(airquality,Temp<=75);set1
set2=subset(airquality,Temp>75);set2

#2. What is the mean Ozone level in each group (group1: “set1”; group2: “set2”)
mean(set1$Ozone,na.rm=TRUE)
#17.88095
mean(set2$Ozone,na.rm=TRUE)
#55.89189

#3. Create a new dataframe called “airsamp1”, 
    #which has the first 10 rows of the dataset “airquality”. 
    #Use the dim function to check the dimension of “airsamp1”.
airsamp1=airquality[1:10,];airsamp1
dim(airsamp1)

#4. Add one row - 38,120,7.5,80,5,11 to the dataframe 
  #“airsamp1” using function rbind.
rbind(airsamp1,c(38,120,7.5,80,5,11))

#5. Create another dataframe called “airsamp2”, which has the specific 
    #columns: Ozone, Month and Day. Use the names function to check the 
    #columns (variables) in your new dataframe.
airsamp2=airquality[,c('Ozone','Month','Day')];airsamp2

#6. List all the functions you use in Practical 3.
    #factor; levels; min; 
    #tapply; max; list; summary;
    #dim; class; names; 
    #attach; detach; subset; which; 
    #na.omit; mean; is.na; rbind













