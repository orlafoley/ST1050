#Practical 8 - Review before Mid Term

#2018-2019 Exam Paper (Question 3)
#Create the following variables, 
#using the R dataset ‘airquality’:

ozone=airquality[,'Ozone'] # Targe attribute
solar=airquality[,'Solar.R'] # Predictor attribute (radiation)
temp=airquality[,'Temp'] # Predictor attribute
wind=airquality[,'Wind'] # Predictor attribute
month=airquality[,'Month'] # Predictor attribute

#Note: you need to take account of missing values 
#in these data.

#1. Make a histogram with grey boxes for the ozone data. 
#Which summary measure (mean or median) do you think 
#makes more sense for this variable?
hist(ozone,col=8)
mean(ozone,na.rm=T)
#42.12931
median(ozone,na.rm=T)
#31.5

#Skewed distribution. 
#So the median is probably preferable here.
#2. Compare and comment briefly on the correlations 
#between wind and ozone on one hand, and between 
#temp and ozone on the other hand.
cor(temp,ozone,use='complete.obs') 
#0.6983603
cor(wind,ozone,use='complete.obs')
#-0.6015465
#Ozone is negatively aligned with wind speed, and 
#slightly more strongly positively aligned with temperature.

#3. Plot the relationship between temperature and ozone 
#and add (using ‘lm’) the “line of best fit”, in red 
#with a line width of 2, through this cloud of points. 
#Please use pch=20 when plotting the data points.
plot(temp,ozone)
abline(lm(ozone~temp),col=2,lwd=2)

#4. Make a variable called wind5 which is wind 
#divided by 5. Redo the above plot (including the 
#red line) and improve it so that the size of each 
#point accounts for the wind speed (using wind5) 
#and its colour is set by the month variable. 
#Hint: size of the points is controlled by the cex option.
wind5=wind/5
plot(temp,ozone,cex=wind5,col=month) 
abline(lm(ozone~temp),col=2,lwd=2)

#5. Predict the ozone level when the temperature is 75 degrees.
predict(lm(ozone~temp),newdata=data.frame(temp=75))
#35.15726

#6. Extract the two subsets of airquality comprising of set1: 
#temperature below or equal to 75 and 
#set2: temperature above 75. What is the mean ozone 
#level in each group? Compare the ozone levels in these
#two subsets using an appropriate statistical test and 
#comment on the output of this test.
set1=subset(airquality,temp<=75)
set2=subset(airquality,temp>75)

mean(set1$Ozone,na.rm=T)
#17.88095
mean(set2$Ozone,na.rm=T)
#55.89189

t.test(set1$Ozone,set2$Ozone)
#p-value = 1.882e-14
#mean of x    mean of y
#17.88095     55.8918
#The difference between the means 
#is significant at the 0.05 level.



