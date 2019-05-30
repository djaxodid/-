library(ggplot2)
library(dplyr)
midwest_raw <- as.data.frame(ggplot2::midwest)
midwest <- midwest_raw   #데이터 복사본 생성

head(midwest)

tail(midwest)

View(midwest)

dim(midwest)

str(midwest)

summary(midwest)

midwest <- rename(midwest, total = poptotal)

midwest <- rename(midwest, asian = popasian)

midwest$percent <- (midwest$asian / midwest$total)*100

head(midwest$percent)

hist(midwest$percent)

mean(midwest$percent)

midwest$test <- ifelse(midwest$percent > mean(midwest$percent), "large", "small")

table(midwest$test)

qplot(midwest$test)