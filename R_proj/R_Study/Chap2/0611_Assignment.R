# 2019-06-11 과제
# 조건 : 제거할 단어를 저장한 gsub 파일 제작, stringr 패키지 사용, R markdown 보고서 제작 및 제출

install.packages('KoNLP')
install.packages('wordcloud')
install.packages('stringr')

library(rJava)
library(KoNLP)
library(wordcloud)
library(stringr)
library(RColorBrewer)

useSejongDic()

# Read Data

datas <- readLines('data/서울시 응답소_2015년전체/응답소_2015_01.txt')

i <- 1
for(i in 2:12) {
  datas <- c(datas, readLines(sprintf('data/서울시 응답소_2015년전체/응답소_2015_%02d.txt', i)))
}

words <- sapply(datas, extractNoun, USE.NAMES = F)
words

head(unlist(words), 30) # 처음 30개 데이터 보여주기
data <- unlist(words)

# Data Processing
gsub_txt <- readLines('data/gsub_data.txt')
i <- 1
for(i in 1:length(gsub_txt)) {
  data <- gsub((gsub_txt[i]), '', data)
}

data <- str_replace_all(data, '[^[:alpha:]]', '') # 한영 제외 삭제, stringr library 사용
data <- Filter(function(x) {nchar(x) >=2}, data)
data <- gsub(' ', '', data)
data <- gsub('"\n', '', data)
  

write(unlist(data), 'data/seoul_2.txt') # remove space/crlf
rev <- read.table('data/seoul_2.txt')
nrow(rev) #3640 #3455 #3400

#
wordcount <- table(rev)
wordcount
head(sort(wordcount, decreasing = T), 30)

palete <- brewer.pal(9, 'Set1')
wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per=0.25, min.freq=2,
          random.order = F, random.color = T, colors = palete)
legend(0.3, 1, '서울시 응답소 2015년 분석자료', cex=0.8, fill=NA, border=NA, bg='white',
       text.col='red', text.font=2, box.col='red')


