#Practical 5 - Histograms and Saving Plots
#Writing plot to a file
#Call a function to open a new graphics file, such as png(),jpeg() and pdf(). • Call plot and its friends to generate the graphics image.
#Call dev.off() to close the graphics files.

#For example:
png(file='histogram.png')
hist(rnorm(50),col='yellow')
dev.off()

#Or
pdf(file='histogram.pdf')
hist(rnorm(50),col='yellow')
dev.off()


#Wolf dataset
#1. Set up the wolf dataset as in Assignment 4. 
#Make the ‘local’ variables, including “Hunting”.
wolf=read.csv('/Users/gufengyun/Desktop/wolf_hormone_data_for_dryad.csv') > wolf.sub=subset(wolf,Population!=3)
wolf.sub=droplevels(subset(wolf.sub, Sex!='U'))
wolf.sub$Hunting = 'Heavy'
wolf.sub$Hunting[wolf.sub$Population==1] = 'Light' 
wolf.sub$Hunting = as.factor(wolf.sub$Hunting)
wolf.sub=droplevels(subset(wolf.sub, Sex!='U'))
Sex=wolf.sub$Sex
Population=wolf.sub$Population
Colour=wolf.sub$Colour
Cpgmg=wolf.sub$Cpgmg
Tpgmg=wolf.sub$Tpgmg
Hunting=wolf.sub$Hunting

#2. Using the variable “Hunting”, produce a table to see 
#how many male wolves are in each hunting group.
table(Hunting[Sex=='M'])
#Heavy Light
#55    21


#3. Create these two subsets: 
#Light M=male wolves which are lightly hunted; 
#Heavy M=male wolves who are heavily hunted.
Light_M=subset(wolf.sub,Hunting=='Light' & Sex=='M')
Heavy_M=subset(wolf.sub,Hunting=='Heavy' & Sex=='M')

#4. Make a histogram of each of these subsets for the 
#variable Tpgmg (Testosterone) and place the two histograms 
#one abover the other using par(mfrow())function. 
#(i.e. 2 plots on the one page - one above the other).
par(mfrow=c(2,1))
hist(Heavy_M$Tpgmg,main='Heavily-hunted Male Wolves',
     xlab='Testosterone')
hist(Light_M$Tpgmg,main='Lightly-hunted Male Wolves',
     xlab='Testosterone')

#5. Make one histogram of the male wolves now using 
#the following commands exactly:
par(mfrow=c(1,1))
hist(Light_M$Tpgmg,main='Testosterone in Male Wolves',
     xlab='Testosterone (pg/mg)')
hist(Heavy_M$Tpgmg,density=10,add=T)

#6. Now using xlim and ylim fix that graph.
hist(Light_M$Tpgmg,main='Testosterone in Male Wolves',
       xlab='Testosterone (pg/mg)' + col=5,xlim=c(0,16),
       ylim=c(0,40))
hist(Heavy_M$Tpgmg,density=10,add=TRUE)     

#7. Change the fonts as follows: labelling font is bold; title font is bold and italic; axes (i.e. the numbers on the axes) are italic.
par(font.lab=2,font.main=4,font.axis=3)

#8. Specify the bin size for the bars as ‘2’. 
#Do this using the breaks= argument of hist 
#Hint: using the seq() function, you can specify 
#breaks as seq(min,max,by=2),where min and max are 
#from the xlim you specified. You will need to specify 
#the breaks for both histograms.

hist(Light_M$Tpgmg,main='Testosterone in Male Wolves',
     xlim=c(0,16), ylim=c(0,40), 
     xlab='Testosterone (pg/mg)',
     col=5,breaks=seq(0,16,by=2))
hist(Heavy_M$Tpgmg,density=10,add=T,
     breaks=seq(0,16,by=2))     

#9. Change the bin size to 3 (if you use seq,
#the max may need to to be a multiple of 3 
#that is higher than your previous xlim). 
#See how the histogram profile changes.

hist(Light_M$Tpgmg,main='Testosterone in Male Wolves',
     xlim=c(0,18),ylim=c(0,40), xlab='Testosterone (pg/mg)',
     col=5,breaks=seq(0,18,by=3))
hist(Heavy_M$Tpgmg,density=10,add=T,
     breaks=seq(0,18,by=3))       

#10. Add a legend to the plot. Recall that the command 
#arguments for legend: 
#bty: do you want a box or not (Y/N).
#angle: the angle for lines that will be drawn - 
#this combined with density is instead of the “density” 
#argument in boxplot.
#density: whether to have a solid box or lines. 
#fill: fill the colour squares.

hist(Light_M$Tpgmg,main='Testosterone in Male Wolves',
     xlim=c(0,18), ylim=c(0,40), 
     xlab='Testosterone (pg/mg)',
     col=5,breaks=seq(0,18,by=3))
hist(Heavy_M$Tpgmg, density = 10, add = T,
     breaks = seq(0,18, by = 3))
legend("topright", c("Light", "Heavy"), bty = "n", 
       angle = c(0, 45),density = c(NA, 30), 
       fill=c("cyan", "black"))      



#Exercise
#Set up the airquality dataset as in Practical 4
air=airquality
Ozone=air$Ozone
Solar.R=air$Solar.R
Wind=air$Wind
Temp=air$Temp
Month=air$Month
TempC=round((5/9)*(Temp-32),1)
tempcat=TempC
tempcat[TempC<25]='<25'
tempcat[TempC>=25]='>=25'
tempcat=as.factor(tempcat)

#Plot a histogram of Ozone for the days that are <25; 
#add a histogram to that plot of Ozone for days 
#that are >=25(using add=T). Set appropriate x and y limits. 
#Add title - ‘Ozone by Temperature’and x label - ’Ozone’.

hist(Ozone[tempcat=='<25'],xlim=c(0,180),
     ylim=c(0,32),breaks=seq(0,180,20),
     col=5,main='Ozone by Temperature',xlab='Ozone')
hist(Ozone[tempcat=='>=25'],add=T,xlim=c(0,180),
     ylim=c(0,32), breaks=seq(0,180,20), density=10)
legend("topright",paste(levels(tempcat)),fill=c(5,1),
       density=c(100,20),angle=45)   

#Using the par command set font.main=4 and font.axis=3. 
#Do a boxplot of Ozone level by tempcat, colour the cool 
#temperatures blue and warmer temperatures red. 
#Add the title “Ozone by Temperature (Celsius)”.

par(font.main=4,font.axis=3)
boxplot(Ozone~tempcat,col=c(4,2),
        main='Ozone by Temperature (Celsius)')

#Save these plots to one pdf file called ”airquality.pdf”.
pdf('airquality.pdf') 

hist(Ozone[tempcat=='<25'],xlim=c(0,180),
     ylim=c(0,32),breaks=seq(0,180,20),
     col=5,main='Ozone by Temperature',xlab='Ozone')

hist(Ozone[tempcat=='>=25'],add=T,xlim=c(0,180),ylim=c(0,32),
     breaks=seq(0,180,20),density=10)

legend("topright",paste(levels(tempcat)),
       fill=c(5,1),density=c(100,20),angle=45)

par(font.main=4,font.axis=3)

boxplot(Ozone~tempcat,col=c(4,2),
        main='Ozone by Temperature (Celsius)')

dev.off()








       
       
       
       