
##Median, MAD, and Spearman Correlation Exercises
## EX 1

data(ChickWeight)
head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")


head(chick)
chick = na.omit(chick)

chick_w4 <- chick[,'weight.4']
chick_w4_add <- append(chick_w4, 3000)
# or use function c
chick_w4_add <- c(chick_w4, 3000) 
chick_w4_add 
mean(chick_w4_add) - mean(chick_w4) # Difference between with and without outlier
mean(chick_w4_add)/mean(chick_w4) # Ratio between with and without outlier


      ## EX 2

median(chick_w4_add) - median(chick_w4) # difference
## [1] 0
median(chick_w4_add)/median(chick_w4) # ratio
## [1] 1


      ## EX3 

sd(chick_w4_add) - sd(chick_w4) # difference
## [1] 429.1973
sd(chick_w4_add)/ sd(chick_w4) # ratio
## [1] 101.2859

      ## EX 4

mad(chick_w4_add) - mad(chick_w4) # difference
## [1] 0
mad(chick_w4_add)/ mad(chick_w4) # ratio
## [1] 1

      ## EX 5

chick_w21 <- chick[, 'weight.21']
chick_w21
##  [1] 205 215 202 157 223 157 305  98 124 175 205  96 266 142 157 117
## [17] 331 167 175  74 265 251 192 233 309 150 256 305 147 341 373 220
## [33] 178 290 272 321 204 281 200 196 238 205 322 237 264

plot(chick_w4, chick_w21)


## Mann-Whitney-Wilcoxon Test

data(ChickWeight)
head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")

head(chick)
chick = na.omit(chick)

          ## EX 1

x <- chick %>% filter(Diet == 1) 
x <- x[,'weight.4']

y <- chick %>% filter(Diet == 4) 
y <- y[,'weight.4']
t.test(x,y)$p.value # t.test result with no outlier
## [1] 7.320259e-06
wilcox.test(x,y)$p.value  # wilcox result with no outlier
## Warning in wilcox.test.default(x, y): cannot compute exact p-value
## with ties
## [1] 0.0002011939
x_add <- c(x,200) # outlier added
t.test(x_add,y)$p.value # t-test after outlier
## [1] 0.9380347

#or

x = chick$weight.4[chick$Diet == 1]
y = chick$weight.4[chick$Diet == 4]
t.test(c(x, 200), y)$p.value

          ## EX 2

x = chick$weight.4[chick$Diet == 1]
y = chick$weight.4[chick$Diet == 4]
wilcox.test(c(x, 200), y, exact=FALSE)$p.value
# OR
wilcox.test(x_add,y)$p.value # even with outlier, p-value is not perturbed
## Warning in wilcox.test.default(x_add, y): cannot compute exact p-
## value with ties
## [1] 0.0009840921

          ## EX3 

library(rafalib)
mypar(1,3)
boxplot(x,y)
boxplot(x,y+10)
boxplot(x,y+100)

#What is the difference in t-test statistic (obtained by t.test(x,y)$statistic) between adding 10 and
# adding 100 to all the values in the group y? Take the the t-test statistic with x and y+10 and subtract
# the t-test statistic with x and y+100. The value should be positive.

t.test(x,y+10)$statistic - t.test(x,y+100)$statistic 
##        t 
## 67.75097


            ### QUIZ

head(mtcars$mpg)
[1] 21.0 21.0 22.8 21.4 18.7 18.1
head(mtcars$hp)
[1] 110 110  93 110 175 105
wilcox.test(x,y+10)$p.value
## Warning in wilcox.test.default(x, y + 10): cannot compute exact p-
## value with ties
## [1] 5.032073e-05
wilcox.test(x,y+100)$p.value
## Warning in wilcox.test.default(x, y + 100): cannot compute exact p-
## value with ties
## [1] 5.032073e-05
wilcox.test(c(1,2,3),c(4,5,6))$p.value # Answer
## [1] 0.1

## qUESTION ##3
wilcox.test(c(1,2,3),c(400,500,600))$p.value
## [1] 0.1