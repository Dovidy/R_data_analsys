# EX 1-1. 서울시 응답소 페이지 분석.

install.packages('rJava')
install.packages('KoNLP')
install.packages('wordcloud')

Sys.setenv(JAVA_HOME='C:\\Program Files\\Java\\jre1.8.0_211')

library(rJava)
library(KoNLP)
library(wordcloud)

useSejongDic()