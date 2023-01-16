##DATASET

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename) 

##remove the lines that contain missing values:

dat <- na.omit( dat )

## Question 1: Use dplyr to create a vector x with the body weight of all males on the control (chow) diet.
## What is this population's average?
install.packages("dplyr")
library(dplyr)
head(dat)
dim(dat)
View(dat)
?Filter
##we separate males
males<-dat%>%filter(Sex=="M")
print(males)
unlist(males)
View(males)
head(males)
dim(males)
## we separate chow.
vector_X<-males%>%filter(Diet=="chow")
View(vector_X)
mean(vector_X$Bodyweight)
meanvectorX<-mean(vector_X$Bodyweight)
print(meanvectorX)
## Question 2: 
## Now use the rafalib package and use the popsd() function to compute the population standard deviation.

?popsd
popsd(vector_X$Bodyweight)

##Question 3: Set the seed at 1. Take a random sample  of size 25 from x. What is the sample average?

?sample
set.seed(1)
SampleX<-mean(sample(vector_X$Bodyweight,25))
print(SampleX)

##Question 4: Use dplyr to create a vector y with the body weight of all males on the high fat hf) diet. What is this population's average?

males<-dat%>%filter(Sex=="M")
vector_Y<-males%>%filter(Diet=="hf")
unlist(vector_Y)
print(vector_Y)
mean(vector_Y$Bodyweight)
meanvectorY<-mean(vector_Y$Bodyweight)
print(meanvectorY)


## Question 5: Now use the rafalib package and use the popsd() function to compute the population standard deviation.
popsd(vector_Y$Bodyweight)

## Question 6: Set the seed at 1. Take a random sample  of size 25 from y

set.seed(1)
SampleY<-mean(sample(vector_Y$Bodyweight,25))
print(SampleY)

## Question 7: What is the difference in absolute value between X and Y ?
           
            ##SOLVED WITH EXCEL.

## Repeat the above for females, this time setting the seed to 2.

##we separate females
females<-dat%>%filter(Sex=="F")
print(females)
unlist(females)
View(females)
head(females)
dim(females)

## we separate chow.
vector_XX<-females%>%filter(Diet=="chow")
View(vector_XX)
mean(vector_X$Bodyweight)
meanvectorXX<-mean(vector_XX$Bodyweight)
print(meanvectorXX)
## Sample XX
set.seed(2)
SampleXX<-mean(sample(vector_XX$Bodyweight,25))
print(SampleXX)

## we separate HF.
vector_YY<-females%>%filter(Diet=="hf")
View(vector_YY)
mean(vector_YY$Bodyweight)
meanvectorYY<-mean(vector_YY$Bodyweight)
print(meanvectorYY)
## Sample XX
set.seed(2)
SampleYY<-mean(sample(vector_YY$Bodyweight,25))
print(SampleYY)

##Equivocado: respuesta: 

x <- filter(dat, Sex=="F" & Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(2)
X <- sample(x,25)
y <- filter(dat, Sex=="F" & Diet=="hf") %>% select(Bodyweight) %>% unlist
set.seed(2)
Y <- sample(y,25)
abs( ( mean(y) - mean(x) ) - ( mean(Y) - mean(X) ) )
