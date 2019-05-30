library(dplyr)
exam <- read.csv("csv_exam.csv")
raw_exam <- exam
exam
exam %>% filter(class == 1)
exam %>% filter(class == 2)
exam %>% filter(class != 1)
exam %>% filter(class != 3)
exam %>% filter(math > 50)
exam %>% filter(math < 50)
exam %>% filter(english >= 80)
exam %>% filter(english <= 80)
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(class == 2 & english >= 80)
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(science <50 | english < 90)
exam %>% filter(class == 1 | class == 3 | class == 5)
exam %>% filter(class %in% c(1, 3, 5))

class1 <- exam %>% filter(class == 1) #class가 1인 행 추출, class1에 할당
class2 <- exam %>% filter(class == 2) #class가 2인 행 추출, class2에 할당
mean(class1$math) #1반 수학 점수 평균 구하기
mean(class2$math) #2반 수학 점수 평균 구하기

exam %>% select(math)
exam %>% select(english)
exam %>% select(class, math, english)
exam %>% select(-math)
exam %>% select(-math, -english)
exam %>% filter(class == 1) %>% select(english)
exam %>% 
  filter(class == 1) %>% 
  select(english)
exam %>% 
  select(id, math) %>% 
  head()
exam %>% 
  select(id, math) %>% 
  head(10)

exam %>%  
  arrange(math)
exam %>%
  arrange(desc(math))

exam %>% 
  arrange(class, math)

exam %>% 
  mutate(total = math + english + science,
         mean = (math + english + science)/3) %>% 
  head

exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head

exam %>% 
  mutate(total = math + english + science) %>% 
  arrange(total) %>% 
  head

exam %>% 
  summarise(mean_math = mean(math))

exam %>% 
  group_by(class) %>%
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n())