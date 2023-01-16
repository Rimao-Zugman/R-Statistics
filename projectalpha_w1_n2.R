library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)
read.csv("msleep_ggplot2.csv")
animales<-read.csv("msleep_ggplot2.csv")
View(animales)
animales_primates<-animales %>% filter(order=="Primates")
View(animales_primates)
nrow(animales_primates)
class(animales_primates)
sleeptotalprimates<-animales_primates %>% select(sleep_total)
View(sleeptotalprimates)
class(sleeptotalprimates)
mean(sleeptotalprimates)
avgsleeptotalprimates<-sleeptotalprimates %>% unlist
print(avgsleeptotalprimates)
mean(avgsleeptotalprimates)
?summarize
sleeptotalprimates %>% summarize(promedio=mean(sleep_total))
#otro metodo para llegar a lo mismo
