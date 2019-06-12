library(KoNLP)
library(wordcloud)
library(stringr)
library(RColorBrewer)
library(ggplot2)
library(dplyr)

useSejongDic()

## Data Processing for KOR

data <- readLines('data/hiphop.txt')

words <- sapply(data, extractNoun, USE.NAMES = F)
cdata <- unlist(words)
words <- str_replace_all(cdata, "[^[:alpha:]]", "")
words <- gsub(' ', '', words)
words <- Filter(function(x) {nchar(x) >= 2}, unlist(words))

write(unlist(words), 'data/hiphop_2.txt')
rev <- read.table('data/hiphop_2.txt')
wordcount <- table(rev)
head(sort(wordcount, decreasing = T), 10)

## wordcloud

palete <- brewer.pal(9, 'Set1')

wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per = 0.25, min.freq = 2, colors=palete,
          random.order=F, random.color=T)
legend(0.3, 1, '힙합 가사 단어 분석', cex=0.8, fill=NA, border=NA, bg='white',
       text.col='red', text.font=2, box.col='red')


# pie graph

top10 <- head(sort(wordcount, decreasing=T),10)
df_top10 <- as.data.frame(top10)
df_top10

options(digits=2)
df_top10 <- df_top10 %>% 
  mutate(pct = Freq / sum(Freq) * 100) %>% 
  # mutate(ylabel = paste(sprintf("%s\n%4.1f", rev, pct), '%', seq='')) %>% 
  mutate(ylabel = paste(sprintf("%4.1f", pct), '%', seq='')) %>% 
  arrange(desc(rev)) %>% 
  mutate(ypos = cumsum(pct) - 0.5*pct)
df_top10

ggplot(df_top10, aes(x='', y=pct, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  coord_polar('y', start=0) + 
  ggtitle('힙합 가사 단어 분석 top 10') +
  geom_text(aes(y=ypos, label=ylabel), color='black')

# bar graph

ggplot(df_top10, aes(x=rev, y=Freq)) +
  geom_bar(stat='identity', aes(fill=rev)) +
  ggtitle('힙합 가사 단어 분석 top 10')
  
