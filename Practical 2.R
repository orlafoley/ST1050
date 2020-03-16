#Practical 2 - Creating structured data
#Sometimes numbers have some structure or pattern. 
#For example, the integers 1 through 99.
#To enter these into an R session one by one would be very tedious. 
#Fortunately, R has shortcuts for entering data that is sequential or that is repeated in some way.
#Simple sequences: A sequence from 1 to 99 by 1’s is given by 1: 99 in R. 
#The colon operator, :, is used to create sequences from a to b by 1’s. 
#Some examples:

1:10
#1 2 3 4 5 6 7 8 910
rev(1:10)
#10  9  8  7  6  5  4  3  2  1
#This is similar to Python's .reverse()
10:1
#10  9  8  7  6  5  4  3  2  1



#Arithmetic sequences: An arithmetic sequence is determined by a starting point a, 
#a step size, h; and a number of points, n. The seq() function allows us to do this. 
#Some examples:

seq(1,9,by=2)
#1 3 5 7 9
#every second number from 1 to 9
seq(1,10,by=2)
#1 3 5 7 9
#every second number from 1 to 10
seq(1,5,length=5)
#1 2 3 4 5
#divides evenly into 5
seq(1,5,length=6)
#1.0 1.8 2.6 3.4 4.2 5.0
#divides into 6 numbers with equal spacing
#think start, stop, step

#Repeated numbers: When a vector of repeated values is desired, 
#the rep() function is used. The simplest usage is to repeat its first argument 
#a specified number of times, as in
rep(1,10)
#1 1 1 1 1 1 1 1 1 1
#number to be repeated, how many times you repeat it
rep(1:3,3)
#1 2 3 1 2 3 1 2 3
#repeat 1 to 3, three times


#Exercise 1
#Create the following sequences: 1. “a”,“a”,“a”,“a”, “a”, “a”
c('a','a','a','a','a') 
#"a" "a" "a" "a" "a" 
rep('a',5)
#"a" "a" "a" "a" "a"

#2. 1,3,...99 (the odd number in [1:100])
seq(1, 100, by=2)

#3. 1,1,1,2,2,2,3,3,3
c(rep(1,3),rep(2,3),rep(3,3))

#4. 1,1,1,2,2,3
rep(1:3,3:1)

#5. “long”, “medium”, “medium”, “short”, “short”, “short”
rep(c("long","medium","short"),1:3)




#Generating random data
#If you want to generate a random sequence, 
#such as a series of simulated coin tosses or a simulated sequence of Bernoulli trials. 
#Or if you want to sample a dataset randomly. We can use sample() function.

vec=c(1,2,3,4)
#randomly select 3 number from vec

sample(vec,3)
#3 4 2

#Generate a random sequence of 10 simulated flips of a coin (H-Head; T-Tail)

sample(c('H','T'),10,replace=T)
#"T" "H" "H" "T" "H" "H" "T" "H" "T" "H"
#replace has to be true

#Tables are widely used to summarize data. The main R function for creating table is, 
#unsurprisingly, table(). In its simplest usage, table(x) finds all the unique values 
#in the data vector x and then tabulates the frequencies of their occurrence.
#In R, the set.seed function sets the random number generator to a known state. 
#The functions takes one argument, an integer. Any positive integer will work, 
#but you must use the same one in order to get the same initial state.

table(sample(c('H','T'),10,replace=TRUE))
#H     T
#6     4

sample(vec,3)
#3 1 2
sample(vec,3)
#3 2 1

#Initialize the random number generator to a known state
set.seed(1050) 
sample(vec,3)
#2 3 4
set.seed(1050) 
sample(vec,3)
#2 3 4
#rnorm is the Normal distribution’s random number generator in R.


#One random value from the standard normal distribution
rnorm(1)
#-0.7639606
#Two random values from the normal distribution with mean 1 and sd 2
rnorm(2, mean=1, sd=2)
#-1.4211727 and -0.3551356






#Working with indices, subsetting
#Suppose x is a data vector of length n=length(x)
#Table 1: Ways to manipulate a data vector



x[1]              #the first element of x
x[length(x)]      #the last element of x
x[i]              #the ith entry if 1 ≤ i ≤ n
x[c(2,3)]         #the second and third entries
x[-c(2,3)]        #all but the second and third entries
x[1]=5            #assign a value of 5 to first entry; also x[1]<-5
x[c(1,4)]=c(2,3)  #assign values to first and fourth entries
x<3 which(x<3)    #vector with length n of TRUE or FALSE depending if x[i]<3 which indices correspond to the TRUE values of x<3
x[x<3]            #the x values when x<3 is TRUE. Same as x[which(x<3)]





#Exercise 2
#Let our small data set be: 2, 5, 4, 10, 8. 
#Using the vectorization of functions to do: 1. 
#Enter this data into a data vector called ”m”. c()


m=c(2,5,4,10,8)
#2. Find the square of each number.
m^2
#4 25 16100 64

#3. Subtract 6 from each number.
m-6
#-4-1-2 4 2

#4. What is the smallest and largest number?
max(m)
#10
min(m)
#2

#5. Use the sample function to create a vector (called m1) of 10 numbers from the vector ”m” you made. 
#use set.seed(1050) before running your R code.
set.seed(1050)
m1=sample(m,10,replace=T)

#6. Provide a table with the distribution of counts for m1. table()
table(m1)

#7. Create a new vector(m2) of the first 2 elements of m.
m2=m[1:2]

#8. Create a new vector(m3) from m with all elements > 4; 
    #using the length function, print the length of it.
m3 = m[m > 4]

#9. Create a new vector(m4) from m with all numbers less than 4 set to 0.
m4=m
m4[m4<4]=0




#Matrices
#There are various ways to construct a matrix. 
#When we construct a matrix directly with data elements, 
#the matrix content is filled along the column orientation by default. 
#For example, in the following code snippet, the content of B is filled 
#along the columns consecutively. What is the difference between matrix B and B1?

B=matrix(c(2,4,3,1,5,7),nrow=3,ncol=2)
print(B)

#       [,1] [,2]
#[1,]    2    1
#[2,]    4    5
#[3,]    3    7

B1=matrix(c(2,4,3,1,5,7),nrow=3,ncol=2,byrow=T)
B1
#       [,1] [,2]
#[1,]    2    4
#[2,]    3    1
#[3,]    5    7
#We construct the transpose of a matrix by interchanging its columns and rows 
#with the function t.
t(B)
#     [,1] [,2] [,3]
#[1,]    2    4    3
#[2,]    1    5    7
dim(t(B))
#[1] 2 3

#Combining matrices: the columns of two matrices having the same 
#number of rows can be combined into a larger matrix (cbind function). 
#Similarly, we can combine the rows of two matrices if they have the 
#same number of columns with the rbind function. For example, suppose we 
#have other matrix C also with 3 rows and B with 2 columns.


C = matrix(c(7,4,2), nrow=3, ncol=1)
print(C) 
# C has three rows
#   [,1]
#[1,] 7
#[2,] 4
#[3,] 2

 # Combine the columns of B and C
cbind(B,C)
#     [,1] [,2] [,3]
#[1,]    2    1    7
#[2,]    4    5    4
#[3,]    3    7    2

D=matrix(c(6,2),nrow=1,ncol=2)
D 
# D has two columns
#     [,1] [,2]
#[1,]    6    2
# Combine the rows of B and D
rbind(B,D)
#     [,1] [,2]
#[1,]    2    1
#[2,]    4    5
#[3,]    3    7
#[4,]    6    2
#We can name rows using the function rownames. 
#Similarly with columns we use colnames. 
#And we can also deconstruct a matrix by applying the c function, 
#which combines all column vectors into one.

rownames(B)<-c('patient1','patient2','patient3')
B
#           [,1] [,2]
#patient1     2    1
#patient2     4    5
#patient3     3    7


c(B) # deconstruct a matrix
#2 4 3 1 5 7
#apply() can apply over functions over the margins of an array 
#(e.g. the rows or columns of a matrix). It has an argument 
#FUN which takes a function to apply to each element of the object.


help(apply) # check the usage of apply function
apply(B,1,mean) # row mean
#patient1 patient2 patient3
#1.5       4.5     5.0
apply(B,2,mean) # column mean
#3.000000 4.333333
apply(B,1,sort) # sort the rows of a matrix
#     patient1 patient2 patient3
#[1,]        1        4        3
#[2,]        2        5        7

#Arrays
#Arrays are like matrices but can have more or fewer than two dimensions.
arr<-array(rnorm(24),c(2,3,4)) 
arr

#,,1
#           [,1]     [,2]      [,3] 
#[1,] 2.523946 0.4327636 -0.4592445 
#[2,] 1.979203 0.8466130  0.1207099

#,,2
#             [,1]        [,2]      [,3] 
#[1,]   0.2431469  0.35535317 -0.7062046
#[2,] -1.1947965  -0.05957524 -0.4941258

#,,3
#           [,1]     [,2]      [,3] 
#[1,] -0.2132674  1.040467 -0.2853453 
#[2,] 0.4939538   -1.205602 -0.1787363

#,,4
#           [,1]     [,2]      [,3] 
#[1,] 0.1310394 -1.2952780  0.5474490
#[2,] 1.6051290 -0.2536024  0.2388788

dim(arr) # check dimension: 2 by 3 by 4 array
#2 3 4


arr[,,1] # the first 3*4 elements
#           [,1]     [,2]      [,3] 
#[1,] 2.523946 0.4327636 -0.4592445 
#[2,] 1.979203 0.8466130  0.1207099

arr[,2,1] # second column of the first 3*4 elements.
#[1] 0.4327636 0.8466130
