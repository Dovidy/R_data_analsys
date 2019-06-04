var1 <- "aaa" ; var1
var2 <- 111; var2
var3 <- Sys.Date(); var3
var4 <- c("a","b","c"); var4
222 -> var5 -> var6
var5; var6
var8 <- var9 <- 222
var8; var9
string1 <- "Very Easy R Programming"; string1
string2 <- "I'm James Seo"; string2
string3 <- 'He said, "I am single".'; string3
string4 <- "He said, \"I am single\"."; string4

comp <- c(1,"2")
comp
class(comp)

num1 <- 1
num2 <- 2
num1 + num2
char1 <- "a"  
num1 + char1

seq1 <- 1:5
seq1
seq2 <- 'a':'f'    # 문자는 안됨
date1 <- seq(from=as.Date('2014-01-01'),to=as.Date('2014-01-31'),by=1) 
date1
class(date1)
date2 <- seq(from=as.Date('2019-05-30'),
             to=as.Date('2020-05-31'),by='month')
date2
date3 <- seq(from=as.Date('2014-01-01'),
             to=as.Date('2020-05-31'),by='year')   
date3
objects()
.hidden <- 3
.hidden
rm(string2)
ls()
rm(list = ls())
.hidden
rm(.hidden)
