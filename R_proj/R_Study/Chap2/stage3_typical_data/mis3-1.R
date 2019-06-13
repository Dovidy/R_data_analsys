library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(scales)
library(gridExtra)

data <- read.csv('data/야구성적.csv', header=T)
data
head(data, 10)
class(data)

df_data <- data %>%
  mutate(OPS= 출루율+장타율)  %>%
  mutate(bpo = OPS/연봉 * 100) %>% 
  select(선수명,bpo)
df_data

df_data2 <- data %>%
 select(선수명, 안타, 홈런, 출루율, 타율, 볼넷, 도루, 타점, 홈런)
df_data2

options(digits=2)
mean(df_data$bpo)


g1 <- ggplot(data=df_data, aes(x=선수명, y=bpo, fill=선수명)) +
  geom_text(aes(label=sprintf("%0.2f%%", bpo)), vjust=0) +
  geom_bar(stat='identity') +
  geom_hline(yintercept=mean(df_data$bpo), linetype='dashed') + 
  geom_text(aes(1.5, mean(df_data$bpo), label = sprintf("%0.2f%%", mean(df_data$bpo)))) +
  ylab('연봉대비 OPS') +
  ggtitle('2013년 야구선수 연봉대비 OPS') +
  theme(legend.position = 'none')


g2 <- ggplot(df_data2, aes(x=선수명, y='', fill=선수명))

# grid.arrange(g1,g2, ncol=2)


head(data,10)

df_data3 <- data %>%
  mutate(bph = 타점/연봉) %>% 
  mutate(OPS= 출루율+장타율)  %>%
  mutate(bpo = OPS/연봉 * 100) %>% 
  select(선수명, bpo, bph)
head(df_data3, 10)


ggplot(data, aes(x =선수명, y=value, group=variable)) +
  geom_line(aes(color=variable)) +
  geom_point(aes(color=variable)) +
  ylab('') +
  scale_fill_brewer('Pastel1') +
  ggtitle('2014년 1월 마포06번 이용승객수(단위:명)')

