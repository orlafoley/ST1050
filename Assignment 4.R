#Assignment 4 


#1. Use the read.csv() to read in the wolf dataset(wolf hormone data for dryad.csv) from the ST1050 folder on the P drive.

setwd('/Users/orlafoley/Desktop/College/1st Year/Semester 1/ST1050/CSV files')
wolf.sub=read.csv('wolf_hormone_data_for_dryad.csv')

#2. Make a dataframe called “wolf.sub” which is like the one used in class (i.e. only populations 1 and 2).

wolf.sub=data.frame(wolf.sub)

#3. Make a new factor called “Hunting” with levels “Light” and “Heavy” (population 1 is light and population 2 is heavy).

wolf.sub$Hunting='Heavy'
#set a default level
wolf.sub$Hunting[wolf.sub$Population==1]='Light'
#reassign by condition

#4. Now get rid of the empty “U” factor for Sex using: wolf.sub=droplevels(subset(wolf.sub,Sex! =U))

wolf.sub=droplevels(subset(wolf.sub,Sex!='U'))

#5. For simplicity in functions, set up variable names: 

Sex=wolf.sub$Sex 
Population=wolf.sub$Population 
Colour=wolf.sub$Colour 
Cpgmg=wolf.sub$Cpgmg 
Hunting=wolf.sub$Hunting

#6. Make two histograms of Cortisol levels (Cpgmg) in “Light” and “Heavy” hunted. 
  #Put these histograms side by side (you will need par(mfrow=c(1,2))), 
  #and label the plots with xlab=“Heavily Hunted” (or “Lightly Hunted”) and use a title “Cortisol in Wolves”.

par(mfrow=c(1,2))
hist(Cpgmg[Hunting=='Light'],main='Cortisol in Wolves',xlab='Lightly Hunted')
hist(Cpgmg[Hunting=='Heavy'],main='Cortisol in Wolves',xlab='Heavily Hunted')

#7. Make a variable col=wolf.sub$Colour and make a table of that variable.

col=wolf.sub$Colour 
table(col)

#8. Now make a boxplot for Cortisol with the following boxes, in this order: female & Dark; male & Dark;
#female & White; male & White. Using boxplot(Cpgmg∼Sex+col).

boxplot(Cpgmg~Sex+col)

#9. Now redo it, adding names=c(“F-Dark”,“M-Dark”,“F-White”,“M-White”).

boxplot(Cpgmg~Sex+col,names=c('F-Dark','M-Dark','F-White','M-White'))

#10. Recall we can change the order of a factor: Sex_new=ordered(Sex,levels=c(“M”,“F”))

Sex_new=ordered(Sex,levels=c('M','F'))

#11. Re-do the boxplot, using that new variable and leaving out “names”, and see that the order has changed.

boxplot(Cpgmg~Sex_new+col)
#ordered M, F instead of F, M