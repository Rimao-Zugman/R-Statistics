##Question 1

## Set the seed at 1 and obtain two samples, each of size N = 25, 
# from non-smoking mothers (dat.ns) and smoking mothers (dat.s). 
# Compute the t-statistic (call it tval).

N <- 25
set.seed(1)
dat.ns <- sample(bwt.nonsmoke,N)
dat.s <- sample(bwt.smoke,N)
tval <- (mean(dat.s) - mean(dat.ns)) / sqrt(var(dat.s)/N + var(dat.ns)/N)
t.test(dat.s,dat.ns)$statistic[[1]]


## MONTECARLO 
## QUESTION 1
set.seed(1)
n <- 5
sample1 <- rnorm(n)
tstat <- sqrt(5)*mean(sample1)/sd(sample1)
tstat
## [1] 0.3007746

## QUESTION 2

set.seed(1)
samp <- rnorm(5)
tstat <- sqrt(5)*samp/sd(samp)

get_t <- function(n) {
  samp <- rnorm(n)
  tstat <- sqrt(n)*mean(samp)/sd(samp)
  return(tstat)
}
set.seed(1)
res_list <- replicate(1000, get_t(5))
mean(res_list > 2)
## [1] 0.068

## QUESTION 3

B <- 1000
ps = seq(1/(B+1), 1-1/(B+1),len=B)

get_t <- function(n) {
  samp <- rnorm(n)
  tstat <- sqrt(n)*mean(samp)/sd(samp)
  return(tstat)
}

Ns <- c(5,10,50,100)
mypar(2,2)
set.seed(1)
for (i in seq_along(Ns)) {
  res_list <- replicate(1000, get_t(Ns[i]))
  theory_t <- qt(ps,df=Ns[i]-1)
  qqplot(theory_t, res_list, main = paste0('sample size= ',Ns[i]),
         xlab = 'theory', ylab = 'sim')
  abline(0,1)
}

## QUESTION 4

ttestgenerator <- function(n) {
  cases <- rnorm(n)
  controls <- rnorm(n)
  tstat <- t.test(cases,controls)$statistic[[1]]
  return(tstat)
}

Ns <- c(5,10,50,100)
mypar(2,2)
set.seed(1)
for (i in seq_along(Ns)) {
  res_list <- replicate(1000, ttestgenerator(Ns[i]))
  theory_t <- qt(ps,df=2*Ns[i]-2)
  qqplot(theory_t, res_list, main = paste0('sample size= ',Ns[i]),
         xlab = 'theory', ylab = 'sim')
  abline(0,1)
}

## QUESTION 5

set.seed(1)
res_list <- replicate(1000, {
  X <- sample(c(-1,1),15,replace = T)
  tstat <- sqrt(15) * mean(X)/sd(X)
  return(tstat)
})

ps <- seq(1/(B+1), 1-1/(B+1),len=B)
theory_t <- qt(ps,df=14)
qqplot(res_list, theory_t)

    ##False. Instead, it is approximated by 
    ## binomial distribution because the data are binary (only two values).

## QUESTION 6

set.seed(1)
res_list <- replicate(1000, {
  X <- sample(c(-1,1),1000,replace = T)
  tstat <- sqrt(1000) * mean(X)/sd(X)
  return(tstat)
})
B<-1000
ps <- seq(1/(B+1), 1-1/(B+1),len=B)
theory_t <- qt(ps,df=999)
qqplot(res_list, theory_t)
abline(0,1)

## true 

## QUESTION 7

      ## A: The sample median is approximately normal with mean 0 
# and SD larger than 1 /  √N.
