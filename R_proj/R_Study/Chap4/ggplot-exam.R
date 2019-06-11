## 1
mpg

ggplot(mpg, aes(x=cty, y=hwy)) + theme_bw() + geom_point()

## 2
library(dplyr)
midwest

ggplot(midwest %>% 
         select(poptotal, popasian) %>%
         filter(popasian <= 10000 & poptotal <= 500000), 
       aes(x=poptotal, y=popasian)) + theme_bw() + geom_point()

## 3 "suv" 차종을 대상으로 평균 cty(도시 연비)가 가장 높은 회사 다섯 곳을 막대 그래프로 표현해 보세요. 막대는 연비가 높은 순으로 정렬하세요
# class='suv', mean(cty)
mpg
mpg2 <- mpg %>%
  group_by(manufacturer) %>%
  filter(class=='suv') %>%
  summarise(average = mean(cty, na.rm=TRUE)) %>% 
  arrange(desc(average)) %>% 
  head(5)

ggplot(mpg2, aes(x=reorder(manufacturer, -average), y=average)) + theme_bw() + geom_col(stat='identity')

## 4
mpg_ <- mpg

mpg3 <- mpg %>%
  group_by(class) %>%
  summarise(count=n())

ggplot(mpg3, aes(x=class, y=count)) + geom_bar(stat='identity')

## 5
economics
ggplot(economics, aes(x=date, y=psavert)) + geom_line()

## 6

comp <- mpg  %>% filter(class=='compact') %>% select(cty)  
subc <- mpg %>% filter(class=='subcompact') %>% select(cty)
suv <- mpg %>% filter(class=='suv') %>% select(cty)

class_cty <- mpg %>% 
  select(class, cty) %>%
  filter(class=='compact' || class=='subcompact' || class=='suv')

class_cty

ggplot()

df3class <- mpg %>% 
  filter(class %in% c('compact', 'subcompact', 'suv'))
ggplot(df3class, aes(x=class, y=cty), )

boxplot(comp, subc, suv, col=c('blue', 'yellow', 'pink'),
        names=c('compact','subcompact','suv'),
        horizontal=T)

## 7-1
diamonds

cuts <- diamonds %>% 
  group_by(cut) %>% 
  summarise(counts = n())

ggplot(cuts, aes(x=cut, y=counts)) + geom_bar(stat='identity')
ggplot(diamonds, aes(x=cut, fill=cut)) + geom_col() # 대박적


## 7-2
prices <- diamonds %>% 
  group_by(cut) %>% 
  summarise(avg_price=mean(price, na.rm=TRUE))

ggplot(prices, aes(x=cut, y=avg_price, group=1)) + geom_line()
ggplot(prices, aes(x=cut, y=avg_price, fill=cut)) + geom_col()

## 7-3

df_color


