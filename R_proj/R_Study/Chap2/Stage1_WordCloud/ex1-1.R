# EX 1-1. 서울시 응답소 페이지 분석.

# set

install.packages('rJava')
install.packages('KoNLP')
install.packages('wordcloud')

# Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre_blah_blah')

library(rJava)
library(KoNLP)
library(wordcloud)
library(RColorBrewer)

useSejongDic()

data1 <- readLines('data/seoul_new.txt')
data1 # Raw data
extractNoun('서울시 버스정책을 역행하는 행위를 고발합니다.')

data2 <- sapply(data1, extractNoun, USE.NAMES=F)
data2 # 명사들만 있는 리스트 형태의 데이터

head(unlist(data2), 30)

data3 <- unlist(data2)
data3 #명사 데이터

data3 <- gsub("\\d+","", data3)
data3 <- gsub(  "서울시","", data3)
data3 <- gsub("서울","", data3)
data3 <- gsub("요청","", data3)
data3 <- gsub("제안","", data3)
data3 <- gsub("-","", data3)
data3 <- gsub("","", data3)
data3

write(unlist(data3), "data/seoul_2.txt")
data4 <- read.table('data/seoul_2.txt')
data4
nrow(data4)
wordcount <- table(data4)
wordcount
head(sort(wordcount, decreasing=T), 20)

# delete useless data
data3 <- gsub("OO","", data3)
data3 <- gsub("개선","", data3)
data3 <- gsub("문제","", data3)
data3 <- gsub("관리","", data3)
data3 <- gsub("민원","", data3)
data3 <- gsub("이용","", data3)
data3 <- gsub("관련","", data3)
data3 <- gsub("시장","", data3)

write(unlist(data3), "data/seoul_3.txt")
data4 <- read.table("data/seoul_3.txt")
wordcount <- table(data4)
head(sort(wordcount, decreasing=T), 20)

# library(RColorBrewer)
palete <- brewer.pal(9, "Set3")
wordcloud(names(wordcount), freq=wordcount, scale=c(5,1), rot.per = 0.25, min.freq = 1, 
          random.order = F, random.color = T, colors = palete)
legend(0.3, 1, "서울시 응답소 요청사항 분석", cex=0.8, fill=NA, border=NA, bg='white',
       text.col='red', text.font=2, box.col='red')


## 2-1-2. 

# 1. KoNLP 실습
v1 <- ("봄이 지나면 여름이고 여름이 지나면 가을입니다.그리고 겨울이죠")
extractNoun(v1)

v2 <- ("봄이지나 면여름이고 여름이지나면가을 입니다")
extractNoun(v2)

v3 <- c('봄이 지나면 여름이고 여름이 지나면 가을입니다',
        '그리고 겨울이죠')
extractNoun(v3)

v4 <- sapply(v3, extractNoun, USE.NAMES=F)
v4

#2. wordcloud Package

wordcloud(c(letters, LETTERS, 0:9), seq(1, 1000, len=62))

palete <- brewer.pal(9, "Set1")
wordcloud(c(letters, LETTERS, 0:9), seq(1, 1000, len=62), colors=palete)
