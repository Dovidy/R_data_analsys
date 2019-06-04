# Function 
mat1 <- matrix(c(1:6), nrow = 2, byrow = T)
a <- rep(1, 3)
sweep(mat1, 2, a)
b <- matrix(c(2, 2))
sweep(mat1, 1, b)     # 행 방향으로 Sweep

a <- c(1,2,3,4,5); length(a)
length(mat1)
library(googleVis)
length(Fruits)

log(10)
log10(10)
sin(pi)
abs(-1)
v2 <- c(1,-2,3,-4)
abs(v2)

ceiling(2.3)
floor(2.3)
ceiling(-2.3)
floor(-2.3)
round(2.5)
round(2.51)
?round()

choose(5, 3)

myfunc <- function() {
  return(10)
}
myfunc()
myfunc2 <- function(x) {
  y = x * x;
  return(y)
}
myfunc2(-3)

# 연습문제
exfunc1 <- function(a, b) {
  result <- a - b
  return(result)
}
exfunc1(3, 5)
exfunc1(56, 34)

exfunc2 <- function(a, b) {
  result <- abs(exfunc1(a, b))
  return(result)
}
exfunc2(123, 456)
