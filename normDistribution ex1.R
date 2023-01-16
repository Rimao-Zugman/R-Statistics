library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
## X representa peso de la población total
## set the seed at 1, then using a for-loop take a random sample of 5 mice 1,000 times.
## Save these averages. After that, set the seed at 1, 
## then using a for-loop take a random sample of 50 mice 1,000 times.
## 5 MICE/1000
set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}
hist(averages5) ##take a look
mean( abs( averages5 - mean(x) ) > 1)
##50MICE /1000 
set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages5[i] <- mean(X)
}
hist(averages5) ##take a look
mean( abs( averages5 - mean(x) ) > 1)
## cLASS TELSS ME:
##Save these averages:
# make averages5
set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}

# make averages50
set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages50[i] <- mean(X)
}
hist(averages5)
hist(averages50)
##For the last set of averages, the ones obtained from a sample size of 50, 
## ¿what proportion are between 23 and 25?
## Respuesta correcta!
mean( averages50 < 25 & averages50 > 23)
## pnorm(x,mu, sigma)
## pnorm( (x-mu)/sigma
## What is the proportion of observations between 23 and 25 in a normal distribution
## with average 23.9 and standard deviation 0.43
pnorm(averages50-23.9)/0.43
989/1000
