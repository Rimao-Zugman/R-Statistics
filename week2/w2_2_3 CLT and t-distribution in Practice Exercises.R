#EJERCICIOS 2.2.3

library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )

?pnorm
head(dat)

pnorm(dat$Bodyweight, sd=1)


## EJERCICIOS 2.2.4

## Exercises 3-13 use the mouse data set we have previously downloaded:

library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)

## Suppose we are interested in the proportion of times we see a 6 when rolling n=100 dice.
## This is a random variable which we can simulate with x=sample(1:6, n, replace=TRUE) 
## and the proportion we are interested in can be expressed as an average: mean(x==6)
## Because the die rolls are independent, the CLT applies.

## We want to roll n dice 10,000 times and keep these proportions.
## This random variable (proportion of 6s) has mean p=1/6 and variance p*(1-p)/n.
## So according to the CLT, z = (mean(x==6) - p) / sqrt(p*(1-p)/n) should be normal with mean 0 and SD 1.
## Set the seed to 1, then use replicate() to perform the simulation, 
## and report what proportion of times z was larger than 2 in absolute value (CLT says it should be about 0.05).

set.seed(1)
n <- 100
sides <- 6
p <- 1/sides
zs <- replicate(10000,{
  x <- sample(1:sides,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(zs)
abline(0,1)#confirm it's well approximated with normal distribution
mean(abs(zs) > 2)

## Run the simulation from exercise 1, but for different values of p and n.
## For which of the following is the normal approximation best?

ps <- c(0.5,0.5,0.01,0.01)
ns <- c(5,30,30,100)
library(rafalib)
mypar(4,2)
for(i in 1:4){
  p <- ps[i]
  sides <- 1/p
  n <- ns[i]
  zs <- replicate(10000,{
    x <- sample(1:sides,n,replace=TRUE)
    (mean(x==1) - p) / sqrt(p*(1-p)/n)
  }) 
  hist(zs,nclass=7)
  qqnorm(zs)
  abline(0,1)
}

#EJERCICIO 3 
## X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
## Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist


library(dslabs)
data("divorce_margarine")
plot(divorce_margarine$margarine_consumption_per_capita, divorce_margarine$divorce_rate_maine)
cor(divorce_margarine$margarine_consumption_per_capita, divorce_margarine$divorce_rate_maine)
