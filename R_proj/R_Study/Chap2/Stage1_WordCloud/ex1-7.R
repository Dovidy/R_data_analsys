# ex 1-7.

library(KoNLP)
library(wordcloud)
library(RColorBrewer)

alert <- readLines('data/oracle_alert_testdb.log')
error_1 <- gsub(' ', '_', alert)
head(unlist(error_1), 20)
error_2 <- unlist(error_1)
error_2 <- Filter(function(x) {nchar(x) >= 5}, error_2)
head(error_2, 10)

error_3 <- grep('^ORA-+', error_2, value=T)
head(unlist(error_3), 20)
write(unlist(error_3), 'data/alert_testdb_2.log')
rev <- read.table('data/alert_testdb_2.log')
nrow(rev) # 9810
errorcount <- table(rev)
head(sort(errorcount, decreasing = T), 20)

palete <- brewer.pal(9, 'Set1')
wordcloud(names(errorcount), max.words=100, freq=errorcount, scale=c(5, 0.5), rot.per=0.25, min.freq=3,
          random.order=F, random.color=T, colors=palete)
legend(0.3, 1, 'Oracle Alert Log File   ', cex=0.8, fill=NA, border=NA, bg='white', 
       text.col='red', text.font=2, box.col='red')