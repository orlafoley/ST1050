#ST1050 Assignment 3

#Question 1
#1. Make a vector called vec=c(seq(2,30,3),NA)
#2. What is the standard deviation (sd()) of “vec” (Don’t forget to remove the NA value). 
#3. Using the function is.na() set the NA value to 32

vec=c(seq(2,30,3),NA)
#every third number from 2 to 30, NA is added to the end
NA_contained=sd(vec)
#don't get the SD this way, still has NA value
NA_removed=sd(vec,na.rm = T)
#sd is 9.082951 without NA
vec[is.na(vec)]=32
#any value that is NA has been replaced by 32
sd(vec)
#sd changed to 9.949874 now



#Question 2
#1. If b<-list(a=1:10,c=“Hello”,d=“AA”), write an R expression that will give all elements, except the second, of the first vector of b.
#2. If Newlist<-list(a=1:10,b=“Good morning”,c=“Hi”), write an R statement that will add 1 to each element of the first vector in Newlist.
#3. Let x<-list(a=5:10,c=“Hello”,d=“AA”), write an R statement to add a new item z=“Newitem” to the list x.
#4. Consider y<-list(“a”,“b”,“c”), write an R statement that will assign new names ‘’one”, ‘’two” and “three” to the elements of y.

b=list(a=1:10,c='Hello',d='AA')
Newlist<-list(a=1:10,b='Good morning',c='Hi')
x<-list(a=5:10,c='Hello',d='AA')
y<-list('a','b','c')
#now we have each list mentioned in the question
b$a[-2]
#each vector(a,c,d) is accessed by $, first elements are accessed by []
Newlist$a=Newlist$a+1
Newlist$a
#first vector is a, add one to each element of a, no need to use [] as it is applied to all
x$z='Newitem'
#similar to Python's append
names(y)=c('one','two','three')
#changes from [1],[2],[3] to ['one'],['two'],['three']



#Question 3
#Using R built-in dataset “Orange”
#1. Print out the first 5 lines of “Orange” (using head() function)
#2. Now use the nrow function to see how many observations are in the dataset.
#3. How many variables in this dataset? Look at the variable “Tree”, what is the data type of this variable? 
    #character, numeric or factor? Notice the levels for tree are set so that the trees are ordered.
#4. Set new variables from the data frame as follows:
    #circ=Orange$circumference 
    #age=Orange$age 
    #tree=Orange$Tree
#5. Using subsetting, look at the summary of each tree’s circumference individually. e.g. summary(circ[tree==1]).
#6. What do you think the ordering on the levels of tree (i.e. 3<1<5<2<4) were based on?

head(Orange,5)
#shows first 5 lines
nrow(Orange)
#35 rows in Orange
class(Orange$Tree)
#tells you "ordered" "factor"
circ=Orange$circumference 
age=Orange$age 
tree=Orange$Tree
#shortens typing time by doing this
summary(circ[tree==1])
summary(circ[tree==2])
summary(circ[tree==3])
summary(circ[tree==4])
summary(circ[tree==5])
#summary tells you min,max,mean,median and 1st/3rd quartiles
#3<1<5<2<4
#ordering based on medians


