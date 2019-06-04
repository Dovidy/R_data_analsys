library(reshape2)
fruits
melt(fruits, id='year')
melt(fruits, id=c('year','name'))
melt(fruits, id=c('year','name'), variable.name='변수명',
     value.name='변수값')
mtest <- melt(fruits, id=c('year','name'), variable.name='변수명',
              value.name='변수값')
dcast(mtest, year+name~변수명)
dcast(mtest, name~변수명, sum)
dcast(mtest, name~변수명, sum, subset=.(name=='apple'))

library(stringr)
fruits <- c('apple', 'Apple', 'banana', 'pineapple')
str_detect(fruits, 'A')
str_detect(fruits, 'a')
str_detect(fruits, '^a')
str_detect(fruits, 'e$')
str_detect(fruits, '^[aA]') 
str_detect(fruits, '[aA]')
str_detect(fruits, regex('a', ignore_case = T))

fruits
str_count(fruits, 'a')

str_c("apple", "banana")
str_c("Fruits: ", fruits)
str_c(fruits, " name is ", fruits)
str_c(fruits, collapse="")
str_c(fruits, collapse=", ")

str_dup(fruits, 3)
str_length('apple')
str_length(fruits)
str_length('과일')

str_locate('apple', 'a')
str_locate(fruits, 'a')
str_locate('apple', 'app')

str_replace('apple', 'p', '*')
str_replace('apple', 'p', '++')
str_replace_all('apple', 'p', '*')

fruits <- str_c('apple','/','orange','/','banana')
fruits
str_split(fruits, "/")  

str_sub(fruits, start=1, end=3)
str_sub(fruits, start=6, end=9)
str_sub(fruits, start=7)
str_sub(fruits, start=-5)

str_trim('  apple banana berry  ')
str_trim('\t  apple banana berry  ')
str_trim('  apple banana berry  \n')

