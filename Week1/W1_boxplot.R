#boxplot.
head(InsectSprays)
print(InsectSprays)
colnames(InsectSprays)
View(InsectSprays)
boxplot(InsectSprays) 
length(InsectSprays)
InsectSprays[1:72,1]
InsectSprays[1:72,2]
sprays_types<-InsectSprays[1:72,2] 
View(sprays_types)
#boxplot( vector/formula +dataframe +notch/TRUE + varwidth + names +main)
input<-sprays_types[,c("A","B","C","D","E")]
boxplot(split(InsectSprays, sprays_types))
?split
boxplot(split(InsectSprays, factor))
class(InsectSprays)
boxplot(InsectSprays,)
# variable atómica es una que se puede descompponer en otros elementos. 
# Puede incluso ser variable categórica.
# La gracia de estos lenguajes es que hay  muchas cosas hechas, ya viene todo listo
# 
boxplot(InsectSprays) 
boxplot(spray ~ sprays_types, data = InsectSprays)
boxplot(count ~ spray, data = InsectSprays)
mypar(1,3)
males <- filter(nym.2002, gender=="Male") %>% select(time) %>% unlist
females <- filter(nym.2002, gender=="Female") %>% select(time) %>% unlist
boxplot(females, males)
hist(females,xlim=c(range( nym.2002$time)))
hist(males,xlim=c(range( nym.2002$time)))
