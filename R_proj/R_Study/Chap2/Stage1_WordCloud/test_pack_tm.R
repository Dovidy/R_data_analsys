# Eng Doc Analyse - Steve Jobs' Announce

install.packages('wordcloud')
install.packages('tm')
library(wordcloud)
library(tm)
library(RColorBrewer)

data <- readLines('data/tm_test1.txt')
data
class(data)
data <- iconv(data, "WINDOWS-1252", "UTF-8") # mac convert

corp1 <- VCorpus(VectorSource(data)) # Not Corpus().
corp1
inspect(corp1)

tdm <- TermDocumentMatrix(corp)
tdm

m <- as.matrix(tdm)
m

corp2 <- tm_map(corp1, stripWhitespace)
corp2 <- tm_map(corp2, tolower)
corp2 <- tm_map(corp2, removeNumbers)
corp2 <- tm_map(corp2, removePunctuation)
corp2 <- tm_map(corp2, PlainTextDocument)
sword2 <- c(stopwords('en'), 'and', 'but', 'not')
corp2 <- tm_map(corp2, removeWords, sword2)

tdm2 <- TermDocumentMatrix(corp2)
tdm2

m2 <- as.matrix(tdm2)
m2
class(m2)

colnames(m2) <- c(1:4)
m2

freq1 <- sort(rowSums(m2), decreasing = T)
head(freq1, 20)

freq2 <- sort(colSums(m2), decreasing = T)
head(freq2, 20)

findFreqTerms(tdm2, 2)

palete <- brewer.pal(7, 'Set3')
wordcloud(names(freq1), freq=freq1, scale=c(5,1),
          min.freq=1, colors=palete, 
          random.order = F, random.color=T)
legend(0.3, 1, 'tm Package Test #1', cex=1, fill=NA, border=NA, bg='white', 
       text.col='red', text.font=2, box.col='red')

barplot(freq1, main='tm package test #2', las=2, ylim=c(0,5))