c(1,2,3,4,5)
c(1,2,3,4,"5")
vec1 <- c(1,2,3,4,5)
vec1
vec1[3]
vec1[-3]
vec1[1:3]
length(vec1)
vec1[1:(length(vec1)-2)]
vec1[length(vec1)]
vec1[-1:-3]
vec1[2:4]

vec1[2] <- 6; vec1

vec1 <- c(vec1, 7); vec1
vec1[7] <- 8; vec1
vec1[9] <- 9; vec1
append(vec1,10,after=6)
append(vec1,c(10,11),after=3)
vec1 <- append(vec1,c(10,11),after=3); vec1
append(vec1,100,after=0)

c(1,2,3) + c(4,5,6)
c(1,2,3) + 1
var1 <- c(1,2,3)
var2 <- c(4,5,6)
var1 + var2
var3 <- c('3','4',5); var3
var1 + var3
union(var1, var3)
var4 <- c(1,2,3,4,5)
var1; var4
var1 + var4
var5 <- c(1,2,3,4,5,6)
var1 + var5

var2 <- c(3,4,5)
var1 - var2
setdiff(var1, var2)
setdiff(var2, var1)

intersect(var1, var2)

fruits <- c(10,20,30); fruits
names(fruits) <- c('apple', 'banana', 'mango')
fruits

var5 <- seq(1:6); var5
var6 <- seq(2,-2) ; var6
even <- seq(2,10,2); even
odd <- seq(1,10,2); odd
var8 <- rep(1:3, 2); var8
var9 <- rep(1:3, each=2); var9

length(var1)

5 %in% even
4 %in% even

# 연습문제
date4 <- seq(from=as.Date('2015-01-01'),
             to=as.Date('2015-01-31'), by=1); date4

vec1 <- c("사과", "배", "감", "버섯", "고구마")
vec1[-3]

vec1 <- c("봄", "여름", "가을", "겨울")
vec2 <- c("봄", "여름", "늦여름", "초가을")
union(vec1, vec2)
setdiff(vec1, vec2)
intersect(vec1, vec2)
