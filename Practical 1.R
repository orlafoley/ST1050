#Practical 1 

#Exercise 1: R environment
#1. Study the four windows of RStudio. See what all the tabs do (some will be empty).
#2. Set up a new R script: File → NewScript
#3. # is the comment character in R. ctrl+enter # run the current line commands
#4. Getting help about function:
  #To get information about a function you know exists, use ’help’ or ’??’. For example:
  #To find out how to do something in R, it works very well to type in google: ”How do I ..... in R”.
#5. Download R and R Studio in your own computer.
  #Download R first
  #Windows: https://cran.r-project.org/bin/windows/ 
  #Mac: https://cran.r-project.org/bin/macosx/ 
  #Download R studio https://www.rstudio.com/products/rstudio/download/



#Exercise 2: Try some basic things
#1. Assignments 
  #Obviously a way to store intermediate results is important so you do not 
  #have to key them in over and over again. R, like other computer languages can 
  #assign symbols to represent values. Assign the value 2 to the variable x:
x = 2
#or
x <- 2
#Note: spacing around operators is generally disregarded but if 
#you are using the arrow to assign an x to 2 when you include a space 
#between the < and −, R will read it as ’less than’ followed by ’minus’).
#Now x has the value 2 and can be used in expressions from now:
#>x
#[1] 2
#> x+x
#[1] 4
#Note: variable names do have some restrictions in R, for examples names cannot 
#start with a digit or with a full-stop followed by a digit. Names are also case-sensitive
#”x” and ’X’ so not refer to the same variable.





#2. Vectors
#A data vector in R is simply an array of numbers. If you wanted to look at data from a group of
#patients R can be utilised to construct a vector variable:
#The code c(...) is used to define vectors. We have defined weight as a vector 
#made up of 6 numbers that could be the weights (in kg) of a group of normal men.
#You can do calculations with vectors just like ordinary numbers, as long as they 
#are the same length. Suppose we also have the heights for the corresponding weights. 
#BMI(body mass index) is the weight in kilograms divided by the square of the height in metres.
#These vectorized calculations make it very easy to specify typical statistical calculations. 
#Consider, for instance the mean and standard deviation of the weight variable.

#Mean:
#> weight<-c(60,72,57,90,95,72) 
#> weight
#[1] 60 72 57 90 95 72
#> height<-c(1.75,1.8,1.65,1.9,1.74,1.91) 
#> bmi<-weight/(height^2)
#> bmi
#[1] 19.59184 22.22222 20.93664 24.93075 31.37799 19.73630
#> sum(weight)
#[1] 446
#> sum(weight)/length(weight)
#[1] 74.33333



#Let’s save the mean in a variable xbar and proceed with the calculation of standard deviation. 
#We will do this in steps to see the individual components.
#Deviations from the mean:
#Since xbar has a length of 1, it is recycled and subtracted from each of the 6 weight values. 
#Squared deviations:
#Standard Deviation:
#Of course since R is a statistical program such calculations are already 
#built into the program, so we could have mean() and sd() function.

#> xbar <- sum(weight)/length(weight) 
#> xbar
#[1] 74.33333
#> weight-xbar
#[1] -14.333333 -2.333333 -17.333333 15.666667 20.666667 -2.333333
#> (weight - xbar)^2
#[1] 205.444444 5.444444 300.444444 245.444444 427.111111 5.444444
#> sqrt(sum((weight-xbar)^2)/(length(weight)-1))
#[1] 15.42293
#> mean(weight)
#[1] 74.33333
#> sd(weight)
#[1] 15.42293

#3. Manage the work environment
#The ls() function and the objects() function will list all the objects (variables, functions, etc) in a
#given work environment. Try them in R.
#To trim down the size of the work environment the functions rm() or remove() can be used. 
#For example, rm(weight) will remove the variable weight from the current work environment.
#There are some keyboard shortcuts for the command line: 
#↑ (up arrow) recalls the previously entered command from the history list and 
#↓ (down arrow) scrolls forward in the history list.

ls()
#> ls()
#character(0)


#Try ctrl+L and rm(list=ls()), see what happens. ctrl + L # clear the console windows
#rm(list = ls()) # clear all the variables in RStudio

rm(list=ls())

#Windows
#R Ctrl+R; Ctrl+L
#R Studio Ctrl+Enter; Ctrl+L

#Mac
#Command + Enter;   Option+Ctrl + L Command + Enter;  Ctrl + L
#Description Run;   Clear Console Run;                Clear Console


#NB Working off a Mac, use these commands ^


