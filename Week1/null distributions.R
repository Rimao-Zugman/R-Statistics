#NULL distribution
install.packages("gapminder")
?gapminder
library(gapminder)
data(gapminder)
head(gapminder)
View(gapminder)
class(gapminder)
##Ejemplo: animales_primates<-animales %>% filter(order=="Primates")
lex52<-gapminder%>%filter(year=="1952")
View(lex52)  
hist(lex52)
boxplot(lex52)
LowLex<-lex52%>%filter(lifeExp<="40")
LowLex
View(LowLex)
dim(LowLex)
##Suppose we want to plot the proportions of countries with life expectancy q 
##for a range of different years. R has a built in function for this, 
##IT IS CALLED: plot(ecdf(x))
##The function is quite easy to build, by turning the code from question 1.1 
##into a custom function, and then using sapply().
##Our custom function will take an input variable q, and return the proportion 
##of countries in x less than or equal to q. The curly brackets, { and }, 
##allow us to write an R function which spans multiple lines:
plot(ecdf(x))
## THIS ALLOWS US TO DO THE FOLLOWING: 
prop = function(q) {
  mean(x <= q)
}
##Try this out for a value of q: prop(40)
##Now let's build a range of qs that we can apply the function to:
qs = seq(from=min(x), to=max(x), length=20)
print(qs)
##Print qs to the R console to see what the seq() function gave us. 
##Now we can use sapply() to apply the prop function to each element of qs:
props = sapply(qs, prop)
#Take a look at props, either by printing to the console, or by plotting it over qs:
plot(qs, props)
#This last style is called using an "inline" function or an "anonymous" function.
#Let's compare our homemade plot with the pre-built one in R:

props = sapply(qs, function(q) mean(x <= q))
#This last style is called using an "inline" function or an "anonymous" function.
##Let's compare our homemade plot with the pre-built one in R:
plot(ecdf(x))

## NULL distributions Part 1
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
set.seed(1)
?sample
sample(x,5)
n<-1000
nulls<-vector("numeric",n)
for(i in 5:n){
  control<-sample(x,5) ##toda esta wea estaba mala
  treatment<-sample(x,5) ##error
  nulls[i]<-mean(treatment)-mean(control) ##meanx
}
obs<-mean(treatment)-mean(control)## malo, aqui falto el HISTOGRAM!
mean(nulls>obs)
##0.018=1,8%
## RESPUESTA CORRECTA:
set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}
hist(averages5) ##take a look
mean( abs( averages5 - mean(x) ) > 1)
##SEGUNDA PREGUNTA: redo the sample from 1,000 to 10,000. Set the seed at 1, 
#then using a for-loop take a random sample of 5 mice 10,000 times. Save these averages.
#¿What proportion of these 10,000 averages are more than 1 gram away from the average of x ?
set.seed(1)
n <- 10000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}
hist(averages5) ##take a look
mean( abs( averages5 - mean(x) ) > 1)
