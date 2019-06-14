library(ggplot2)
install.packages('ggthemes')
library(ggthemes)
library(dplyr)
library(reshape2)

bus09 <- read.csv('data/마포09번이용현황.csv')
length(bus09$승차인원)
bus09$number <- c(1:length(bus09$승차인원))
stop <- bus09$정류소명
ggplot(bus09, aes(x=정류소명)) +
  geom_point(color='orange', aes(x=number, y=승차인원)) +
  geom_line(color='orange', aes(x=number, y=승차인원)) +
  geom_point(color='blue', aes(x=number, y=하차인원)) +
  geom_line(color='blue', aes(x=number, y=하차인원)) +
  labs(x='정류소명', y='승하차 인원 (단위: 천명)') +
  scale_x_continuous(breaks = 1:32, labels = stop) +
  theme(axis.text.x=element_text(angle=45, hjust=1, vjust=1,
                                 colour="black", size=8)) +
  scale_y_continuous(breaks = seq(0,40000,10000), labels = c(0,10,20,30,40)) +
  ggtitle('마포09번 정류소별 승하차 인원') +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, 
                                  size = 15, color = "darkblue")) +
  geom_hline(yintercept=seq(0, 40000, 10000), 
             color='grey', linetype = 'dashed', size=0.1) +
  geom_vline(xintercept=seq(0, 30, 5), 
             color='grey', linetype = 'dashed', size=0.1)