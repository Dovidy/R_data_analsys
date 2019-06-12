install.packages('wordcloud')
install.packages('tm')
library(wordcloud)
library(tm)
library(RColorBrewer)

data1 <- readLines('data/steve.txt')
# data1
# class(data1)

corp1 <- VCorpus(VectorSource(data1))
# corp1
# inspect(corp1)

tdm <- TermDocumentMatrix(corp1)
tdm
# 
# m <- as.matrix(tdm)
# m

corp2 <- tm_map(corp1, stripWhitespace)
corp2 <- tm_map(corp2, tolower)
corp2 <- tm_map(corp2, removeNumbers)
corp2 <- tm_map(corp2, removePunctuation)
corp2 <- tm_map(corp2, PlainTextDocument)
sword2 <- c(stopwords('en'), 'and', 'but', 'not')
corp2 <- tm_map(corp2, removeWords, sword2)

corp3 <- TermDocumentMatrix(corp2, control = list(wordLengths=c(1,10)))
corp3 

findFreqTerms(corp3, 10)
findAssocs(corp3, 'apple', 0.5)

corp4 <- as.matrix(corp3)
corp4

freq1 <- sort(rowSums(crop4), decreasing = T)
freq2 <- sort(colSums(crop4), decreasing = T)
head(freq2, 20)

dim(corp4)
colnames(corp4) <- c(1:59)
freq2 <- sort(colSums(corp4), decreasing = T)

palete <- brewer.pal(7, 'Set3')
wordcloud(names(freq1), freq=freq1, scale=c(5,1), 
          min.freq=5, colors=palete, random.order=F, random.color=T, max.words=15)
legend(0.3, 1, "Steve Jobs Anc Analyse  ", cex=0.8, fill=NA, border=NA, bg='white',
       text.col='red', text.font=2, box.col='red')