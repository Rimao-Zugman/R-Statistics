library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
View(x)
set.seed(1)
#make empty vector to save your averages
averages = vector(length=1000)
#do sampling
for(i in 1:1000) {
  s = sample(50)
  averages[i] = mean(dataframe$weight)[s]
}

set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages5[i] <- mean(X)
}
hist(averages5) ##take a look
mean( abs( averages5 - mean(x) ) > 1)
## pregunta 2
##
library(gapminder)
data(gapminder)
head(gapminder)
View(gapminder)
class(gapminder)
animales_primates<-animales %>% filter(order=="Primates")
lex52<-gapminder%>%filter(year=="1952")
View(lex52)
LowLex<-lex52%>%filter(lifeExp<="60")
class(LowLex)
head(LowLex)
View(LowLex)
Lowlex2<-lex52%>%filter(lifeExp>="40")
View(Lowlex2)w