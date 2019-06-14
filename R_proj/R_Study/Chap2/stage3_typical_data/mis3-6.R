library(ggplot2)
library(dplyr)
library(reshape2)

data <- read.csv('data/버스노선별이용현황합계.csv')
head(data, 10)

df <- melt(data)
df

ggplot(df, aes(x =버스노선번호, y=value/1000, fill=variable)) + 
  geom_bar(stat="identity", position = "dodge") +
  scale_fill_brewer(palette = 'Pastel1') +
  xlab('노선명') +
  ylab('이용승객수(단위수:천명)') +
  geom_text(aes(label=value), position=position_dodge(width=0.9), vjust=-0.25, colour='Blue') +
  theme(axis.text.x=element_text(angle=45, hjust=1))+
  ggtitle('2014년 1월 서울 주요 마을버스 이용 승객 현황')
  
