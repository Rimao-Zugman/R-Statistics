## Association Tests Exercises

#EX1
d = read.csv('assoctest.csv')
tab <- table(d)
chisq.test(tab)$statistic
## X-squared 
##  3.343653

#EX2
fisher.test(tab)$p.value
## [1] 0.05193834

## exploratory data analysis
# Scatterplot
# EX1
data(nym.2002, package="UsingR")
head(nym.2002)
male<-select(nym.2002$gender) ##crear vector 
plot(male$age, male$time, main = 'male')
cor(male$age, male$time)
## [1] 0.2432273

#EX2

plot(female$age, female$time, main = 'female')
cor(female$age, female$time)
## [1] 0.2443156

#EX3

groups_m <- split(male$time, floor(male$age/5)*5) # 10-14, 15-19, etc
groups_f <- split(female$time, floor(female$age/5)*5) # 10-14, 15-19, etc
mypar(1,2)
boxplot(groups_m)
boxplot(groups_f)
#This is a tricky question because the question asks you to stratify the data into groups. 
#Stratification can be achieved via split function. To have each group a range of 5 (ex. 25-30), 
#all the age numbers will have to be rounded up or down so that the resulting numbers will be divisible 
#by 5. I rounded the numbers down by using the floor function. As a result, 40 represents the 40-44 age group. 
#You can also use the ceiling function to stratify the data, which will then be rounded up. So, 45 represents 41-45 age group. 
#In the example below, age of 42 is categorized using both floor and ceiling functions.

floor(42/5)*5 
## [1] 40
ceiling(42/5)*5
## [1] 45
## The appropriate answer is A: Finish times are constant up until about our 40s, then we get slower.

## Symmetry of Log Ratios Exercises


