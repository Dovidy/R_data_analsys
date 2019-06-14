library(dplyr)
library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(scales)
library(gridExtra)





# 1. 다음 문장 개선
vec1 <- c(1,2,3,4,5,6)
vec2 <- c(10, 9, 8, 7, 6, 5)
vec3 <- c(1,1,2,2,3,3)
vec4 <- c(1,2,3,1,2,3)
vec5 <- c(1,3,5,7,9,11)

vec1 <- c(1:6)
vec2 <- c(10:5)
vec3 <- rep(1:3, each=2)
vec4 <- rep(c(1:3), 2)
vec5 <- seq(1, 11, by=2)

# 2. data
# 2-1


df_score <- data.frame(col1=c(90, 78, 94, 70), col2=c(50, 60, 90, 92))
colnames(df_score) <- c('중간', '기말')
rownames(df_score) <- c('강경학', '김태균', '이성열', '정은원')
df_score
class(df_score)

# 2-2
df_score <- df_score %>% 
  mutate(평균=(중간+기말)/2)

df_score

# 3.
df_score <- df_score %>% 
  mutate(학점=평균)

score_fun <- function(avg){
  z <- avg
  for(i in avg)
    if(avg >= 90){
      z[i] <- 'A'
    }else if(avg < 90 & avg >= 80){
      z[i] <- 'B'
    }else if(avg < 80 & avg >= 70){
      z[i] <- 'C'
    }else if(avg < 70 & avg >= 60){
      z[i] <- 'D'
    }else if(avg < 60){
      z[i] <- 'F'
    }
  return(z)
}

df_score1 <- score_fun(df_score$평균)
df_score
df_score2$학점 <- df_score1

# 4.
oddSum <- function(num) {
  sum <- 0
  i <- 1
  
  for(i in seq(1, num, by=2)) {
    sum <- sum + i
  }
 
  return(sum)
}

oddSum(100)

# 5.

# 5-1.
library(dplyr)
head(iris, 10)
ir_set <- iris %>%
  filter(Species == 'setosa')

boxplot(ir_set$Sepal.Width)

# 5-2.
iris
boxplot(iris$Sepal.Width, range=3)

# 6.
mpg %>%
  filter(manufacturer=='toyota') %>%
  group_by(model) %>%
  mutate(ch_avg = (cty + hwy)/2) %>% 
  summarise(평균연비 = mean(ch_avg)) %>%
  arrange(desc(평균연비)) %>%
  head(3)

# 7.
# 7-1.
cty_suv <- mpg %>%
  filter(class=='suv') %>%
  group_by(manufacturer) %>%
  summarise(시내연비 = mean(hwy)) %>%
  arrange(desc(시내연비)) %>%
  head(7)

# 7-2.
ggplot(cty_suv, aes(x=manufacturer, y=시내연비)) + 
  geom_bar(stat='identity')

# 8.
diamonds
ggplot(diamonds, aes(x=clarity, y=hwy)) + theme_bw() + geom_point()


# 9.
data <- read.csv('data/야구성적.csv', header=T)

df_data <- data %>%
  mutate(OPS= 출루율+장타율)  %>%
  mutate(연봉대비OPS = OPS/연봉 * 100) %>% 
  select(선수명, OPS, 연봉대비OPS)
df_data

ggplot(data=df_data, aes(x=선수명, y=연봉대비OPS, fill=선수명)) +
  geom_text(aes(label=sprintf("%0.2f%%", 연봉대비OPS)), vjust=0) +
  geom_bar(stat='identity') +
  theme(legend.position = 'none')





