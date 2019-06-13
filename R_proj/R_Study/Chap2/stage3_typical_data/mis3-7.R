library(ggplot2)
library(dplyr)
library(reshape2)

data <- read.csv('data/마포09번이용현황.csv')
head(data, 10)

df <- melt(data)
head(df, 10)

ggplot(df, aes(x =정류소명, y=value, group=variable)) +
  geom_line(aes(color=variable)) +
  geom_point(aes(color=variable)) +
  ylab('') +
  theme(axis.text.x=element_text(angle=45,hjust=1))+
  scale_fill_brewer('Pastel1') +
  ggtitle('2014년 1월 마포06번 이용승객수(단위:명)')