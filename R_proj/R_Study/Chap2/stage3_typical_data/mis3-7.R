library(ggplot2)
library(dplyr)
library(reshape2)

data <- read.csv('data/마포09번이용현황.csv')

data$num <- c(1:length(data$승차인원))
head(data, 10)

ggplot(data, aes(x=정류소명)) +
  geom_point(color='red', aes(x=num, y=승차인원)) +
  geom_line(color='red', aes(x=num, y=승차인원)) +
  geom_point(color='skyblue', aes(x=num, y=하차인원)) +
  geom_line(color='skyblue', aes(x=num, y=하차인원)) +
  ylab('승하차 인원(단위:천명)') +
  scale_x_continuous(breaks = 1:32, labels = data$정류소명) +
  theme(axis.text.x=element_text(angle=45,hjust=1)) +
  ggtitle('2014년 1월 마포06번 이용승객수')


# head(data, 10)
# nrow(data)
# 
# data$number <- c(1:nrow(data))
# 
# df <- melt(data)
# head(df, 10)
# 
# ggplot(df, aes(x =정류소명, y=value, group=variable)) +
#   geom_line(aes(color=variable)) +
#   geom_point(aes(color=variable)) +
#   ylab('') +
#   theme(axis.text.x=element_text(angle=45,hjust=1))+
#   scale_fill_brewer('Pastel1') +
#   ggtitle('2014년 1월 마포06번 이용승객수(단위:명)')


