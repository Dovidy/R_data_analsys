# 1-3. Recommended Jeju Tour
# 제주 추천 여행코스

# setwd()
install.packages('KoNLP')
install.packages('wordcloud')
install.packages('stringr')
library(KoNLP)
library(wordcloud)
library(stringr)
useSejongDic()

## Read Data
mergeUserDic(data.frame(readLines('data/제주도여행지.txt'), 'ncn'))
txt <- readLines('data/jeju.txt')
place <- sapply(txt, extractNoun, USE.NAMES = F)
place
head(unlist(place), 30)
cdata <- unlist(place)

## Data Processing
place <- str_replace_all(cdata, '[^[:alpha:]]', '') ## remove except kor, eng
place <- gsub(' ', '', place)
txt <- readLines('data/제주도여행코스gsub.txt')
txt
i <- 1
for(i in 1:length(txt)) {
  place <- gsub((txt[i]), '',place)
}
place
place <- Filter(function(x) {nchar(x) >= 2}, place)
write(unlist(place), 'data/jeju_2.txt')
rev <- read.table('data/jeju_2.txt')
nrow(rev)

## 
wordcount <- table(rev)
wordcount
head(sort(wordcount, decreasing = T), 30)

library(RColorBrewer)
palete <- brewer.pal(9, 'Set1')
wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per=0.25, min.freq=2, 
          random.order=F, random.color=T, colors=palete)
legend(0.3, 1, '제주도 추천 여행 코스 분석', cex=0.8, fill=NA, border=NA, bg='white', 
       text.col='red', text.font=2, box.col='red')