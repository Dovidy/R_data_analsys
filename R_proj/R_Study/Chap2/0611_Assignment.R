# 2019-06-11 과제
# 조건 : 제거할 단어를 저장한 gsub 파일 제작, stringr 패키지 사용, R markdown 보고서 제작 및 제출

install.packages('KoNLP')
install.packages('wordcloud')
install.packages('stringr')

library(KoNLP)
library(wordcloud)
library(stringr)
library(RColorBrewer)

useSejongDic()

# Read Data

for(i in 1:12) {
  txt <- readLines(sprintf('data/서울시 응답소_2015년전체/응답소_2015_%02d.txt', i)) 
}

word <- sapply(txt, extractNoun, USE.NAMES = F)
word