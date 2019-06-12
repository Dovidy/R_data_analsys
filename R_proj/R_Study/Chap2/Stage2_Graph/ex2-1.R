library(KoNLP)
library(wordcloud)
library(stringr)
library(RColorBrewer)
useSejongDic()

mergeUserDic(data.frame(readLines('data/제주도여행지.txt'), 'ncn'))

txt <- readLines("data/jeju.txt") 
place <- sapply(txt,extractNoun,USE.NAMES=F)
place   
head(unlist(place), 30)
cdata <- unlist(place) 
place <- str_replace_all(cdata,"[^[:alpha:]]","") 

place <- gsub(" ","", place)
txt <- readLines("data/제주도여행코스gsub.txt")
txt
cnt_txt <- length(txt)
cnt_txt
i<-1
for( i in 1:cnt_txt) {
  place <-gsub((txt[i]),"",place)     
}
place
place <- Filter(function(x) {nchar(x) >= 2} ,place)
write(unlist(place),"data/jeju_2.txt") 
rev <- read.table("data/jeju_2.txt")
nrow(rev)   
wordcount <- table(rev) 
head(sort(wordcount, decreasing=T),30)


top10 <- head(sort(wordcount, decreasing=T),10)
pie(top10,main="제주도 추천 여행 코스 TOP 10")
pie(top10, col=rainbow(10), radius=1, main='제주도 추천 여행코스top10 ')

pct <- round(top10/sum(top10) * 100 ,1)
names(top10)
lab <- paste(names(top10),"\n",pct,"%")
pie(top10,main="제주도 추천 여행 코스 TOP 10",col=rainbow(10), 
    cex=0.8,labels = lab)

# bar 형태의 그래프로 표시하기
bchart <- head(sort(wordcount, decreasing=T),10)
bchart
rev
bp <- barplot(bchart,  main = "제주도 추천 여행 코스 TOP 10 ", col = rainbow(10), 
              cex.names=0.7, las = 2,ylim=c(0,25))

install.packages('ggplot2')
library(ggplot2)
library(dplyr)
df_top10 <- as.data.frame(top10)
df_top10
ggplot(df_top10, aes(x='', y=Freq, fill=rev)) + 
  geom_bar(width=1, stat='identity')
ggplot(df_top10, aes(x='', y=Freq, fill=rev)) + 
  geom_bar(width=1, stat='identity') + 
  coord_polar('y', start=0)


options(digits=2)
df_top10 <- df_top10 %>% 
  mutate(pct = Freq / sum(Freq) * 100) %>% 
  # mutate(ylabel = paste(sprintf("%s\n%4.1f", rev, pct), '%', seq='')) %>% 
  mutate(ylabel = paste(sprintf("%4.1f", pct), '%', seq='')) %>% 
  arrange(desc(rev)) %>% 
  mutate(ypos = cumsum(pct) - 0.5*pct)
df_top10

ggplot(df_top10, aes(x='', y=Freq, fill=rev)) +
  geom_bar(width=1, stat='identity') +
  coord_polar('y', start=0) +
  ggtitle('제주도 추천 여행코스 top 10') +
  geom_text(aes(y=ypos, label=ylabel), color='black')

install.packages("plotrix")
library(plotrix)
th_pct <- round(bchart/sum(bchart) * 100,1)
th_names <- names(bchart)
th_labels <- paste(th_names,"\n","(",th_pct,")")

pie3D(bchart,main="제주도 추천 여행 코스 Top 10",col=rainbow(10), 
      cex=0.3,labels=th_labels,explode=0.05)
