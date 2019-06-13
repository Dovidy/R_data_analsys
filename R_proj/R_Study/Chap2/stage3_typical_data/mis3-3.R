library(ggplot2)
library(dplyr)
library(RColorBrewer)
library(scales)
library(gridExtra)

data <- read.csv('data/2000-2013년 연령별실업율_연령별평균.csv')
head(data, 10)

df <- melt(data)
head(df, 10)

ggplot(df, aes(x = variable, y= value, group=연령별)) +
  geom_line(aes(color=연령별)) +
  geom_point(aes(color=연령별)) +
  ylab('') +
  scale_fill_brewer('Pastel1') +
  ggtitle('연령별 실업률 현황(단위:%)')