# Assignment 2019/09/17 
# Exercise 1 
1+2*(3+4)
4^3+3^(2+1)
sqrt((4+3)*(1+2))
1/sqrt(2*pi)*exp(-2)
# Exercise 2
# create vectors
malewt=c(29.37,31.77,30.97,31.45,31.37,32.24)
femalewt=c(31.79,31.19,32.34,30.72,30.75,32.79)
maleht=c(1.3764,1.4116,1.3896,1.3796,1.3914,1.3989)
femaleht=c(1.3761,1.3870,1.3641,1.3798,1.3887,1.3780)
wt=c(malewt,femalewt)
ht=c(maleht,femaleht)
# Calculate bmi
bmi=wt/(ht^2)
min(bmi)
max(bmi) 
# Mean value
mean(maleht)
mean(malewt)
mean(femaleht)
mean(femalewt)
mw=mean(wt)
mh=mean(ht)
print(c(mw,mh))
# Weight above mean weight
malewt[malewt>mw]
#or 
malewt[which(malewt>mw)] 
# Sort
sort(wt)
sort(ht)
# list all the functions
# c() max() min() mean() print() sort() which()


