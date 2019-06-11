# EX 1-2 Female HighSchool Student's Plastic Surgery part 
# 키워드 '여고생 성형'
# setwd('dir_path')

install.packages('KoNLP')
install.packages('worldcloud')
library(KoNLP)
library(wordcloud)
library(RColorBrewer)
useSejongDic()
# .libPaths() - 라이브러리 설치 경로

#mergeUserDic(data.frame('', '')) - Add words into dictionary file

### Read Data
data1 <- readLines('data/remake.txt')
data1
data2 <- sapply(data1, extractNoun, USE.NAMES = F)
data2
data3 <- unlist(data2)
data3 <- Filter(function(x) {nchar(x) < 10}, data3)
head(unlist(data3), 30)

### Data Processing - Remove/Change Useless word
data3 <- gsub('\\d+', '', data3)
data3 <- gsub('쌍수', '쌍꺼풀', data3)
data3 <- gsub('쌍커풀', '쌍꺼풀', data3)
data3 <- gsub('메부리코', '매부리코', data3)
data3 <- gsub('\\.', '', data3)
data3 <- gsub(' ', '', data3)
data3 <- gsub('\\', '', data3)
data3

### Remove Space/CRLF
write(unlist(data3), 'data/remake_2.txt')
data4 <- read.table('data/remake_2.txt')
data4
nrow(data4)
wordcount <- table(data4)
wordcount

### Data Processing - Remove Useless word 2
head(sort(wordcount,decreasing = T), 20)
txt <- readLines('data/성형gsub.txt')
i <- 1
for(i in 1:length(txt)) {
  data3 <- gsub((txt[i]), '', data3)
}
data3

data3 <- Filter(function(x) {nchar(x) >= 2}, data3)
write(unlist(data3), 'remake_2.txt')
data4 <- read.table('remake_2.txt')
data4

wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing = T), 30)

### Create WordCloud
#library(RColorBrewer)
palete <- brewer.pal(9, 'Set3')
wordcloud(names(wordcount), freq=wordcount, 
          scale=c(5,1), rot.per=0.25, min.freq=2, 
          random.order=F, random.color=T, colors=palete)
legend(0.3, 1, '여고생 선호 성형수술부위', cex=0.8, fill=NA, border=NA, bg='white',
       text.col='red', text.font=2, box.col='red')


# 