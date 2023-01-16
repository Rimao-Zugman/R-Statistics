library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- na.omit( read.csv(filename) )
head(dat)
dim(dat)
View(dat)
head(dat)
dim(dat)
?pnorm
pnorm(dat$Bodyweight)
?sd
## EX 1
pnorm(1)-pnorm(-1)

## EX 2

pnorm(2)-pnorm(-2)

## EX 3

pnorm(3) - pnorm(-3)

## ex 4 

y<-filter(dat,Sex=="M"&Diet=="chow")%>%select(dat$Bodyweight)%>%unlist

z<-(y-mean(y))/popsd(y)

mean( abs(z) <=1 )

##Answer: 0.945

## ex 5

mean( abs(z) <=2)
## Answer:   0.9461883

## EX 6

mean( abs(z) <=3 )

## Answer: 0.9910314

## EX 7

#answer C

## EX 8
mypar(2,2)
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="F" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="M" & Diet=="hf") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)
y <- filter(dat, Sex=="F" & Diet=="hf") %>% select(Bodyweight) %>% unlist
z <- ( y - mean(y) ) / popsd(y)
qqnorm(z);abline(0,1)

## Answer B

## EX 9 

y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)

## 30.95581


