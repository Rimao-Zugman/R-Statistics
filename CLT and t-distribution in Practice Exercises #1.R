## CLT and t-distribution in Practice Exercises

## 
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)

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


## CLT and t-distribution in Practice Exercises #2

    ## p=0.5 y n=30

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

## CLT and t-distribution in Practice Exercises #3

X <- filter(dat, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(dat, Diet=="hf") %>% select(Bodyweight) %>% unlist

mean(X)

## R = 23.8113

## EX = 4

    ## d)

## EX 5 

    ## R= 0

## EX 6

2 * ( 1-pnorm(2/sd(X) * sqrt(12) ) )

    ##0.02189533

## EX 7

    ##  0.02189533

## EX 8 
sqrt( sd(X)^2/12 + sd(Y)^2/12 )
##or 
sqrt( var(X)/12 + var(Y)/12)


    ## 1.469867

## EX 9

( mean(Y) - mean(X) ) / sqrt( var(X)/12 + var(Y)/12)
##or 
t.test(Y,X)$stat

    ## 2.055174

## EX 10

    # a)

## EX 11

Z <- ( mean(Y) - mean(X) ) / sqrt( var(X)/12 + var(Y)/12)
2*( 1-pnorm(Z))

    ## 0.0398622

## EX 12

t.test(X,Y)$p.value

    ##0.053


## EX 13



