#ST1050 Assignment 2

#Question 1 (2018-2019 Exam Paper: Question 1)
#Please use set.seed(1) before running your R code.
#1. Generate a random sample of size N=100 of integer values between 1 and 5, inclusive. Put the result
#into a vector x. Hint: sample() function
#2. Provide a table with the distribution of counts for this sample. Hint: table() function
#3. What percentage would you expect to find for each number in the table? (Don’t need code, just answer this question in your word document)
#4. What quantity does sum(table(x)*c(1:5))/sum(table(x)) evaluate? (Don’t need code, just answer this question in your word document)
#Hint: Example - toss a die/coin in the first lecture. 

set.seed(1)
x=sample(1:5,100,T)
table(x)
#roughly 20% or 0.2 for each number
#actual values are 22, 22, 16, 19, 21 
#sum(table(x)*c(1:5))/sum(table(x)) gives you the mean - sum of elements / no of elements






#Question 2 (Matrix)
#1. Make a 2 × 3 (2 rows, 3 columns) matrix called ”A” from the numbers 2,4,6,5,7,9. Matrix A is filled by columns.
#2. Get the transpose of A
#3. Make a matrix ”B” that is also 2 × 3 of the numbers 1,3,5,2,4,6. Matrix B is filled by rows.
#4. Combine A and B into one matrix(called ”C1”) using the cbind function.
#5. Combine A and B into one matrix(called ”C2”) using the rbind function.
#6. Give column names to the matrix A as follows: column 1: ”first”, column 2: ”middle”, column3: ”last”.
#7. Sort the columns of matrix A using the apply function.

numbers=c(2,4,6,5,7,9)
A=matrix(numbers, 2, 3)
t(A)
#transpose changes it from 2x3 to 3x2 matrix
numbers2 = c(1,3,5,2,4,6)
B=matrix(numbers2, 2, 3, T)
C1=cbind(A,B)
#C1 is a 2x6 matrix
C2=rbind(A,B)
#C2 is a 4x3 matrix
colnames(A)=c('first','middle','last')
#built in function for column names
apply(A,2,sort)
#sorts in ascending order
#margin 1 = rows, margin 2 = columns





#Question 3 (Array)
#1. Make an array called “myarr” with dimensions 2,3,2, containing the numbers 1 through 12. 
#2. Give the rows the names ”odd” and ”even”. Print it out.
#3. Print the first 2 × 3 elements.
#4. Print the third column in second 2×3 elements.
#5. What are the mean values of “odd” and “even” numbers in “myarr”? Hint: apply() function

myarr=array(1:12,c(2,3,2))
rownames(myarr)=c('odd','even')
print(myarr)
print(myarr[,,1])
print(myarr[,3,2])
#indexed by [row,col,'grouping']
arrmean=apply(myarr,1,mean)
#mean is applied to the rows here
arrmean
#odd's mean is 6, even's mean is 7


