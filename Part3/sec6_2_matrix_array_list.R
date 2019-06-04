# Matrix
mat1 <- matrix(c(1,2,3,4))
mat1
mat2 <- matrix(c(1,2,3,4), nrow=2); mat2
mat3 <- matrix(c(1,2,3,4), nrow=2, byrow=T); mat3

mat3[1, 1]
mat3[1,]
mat3[,1]

mat4 <- matrix(seq(1:9), nrow=3, byrow=T); mat4
mat4 <- rbind(mat4, c(10,11,12)); mat4
mat4 <- cbind(mat4, c(13,14,15,16)); mat4
mat5 <- matrix(c('a','b','c','d'), nrow=2, byrow=T)
mat5 <- cbind(mat5, c('e','f')); mat5

colnames(mat5) <- c('First','Second','Third')
mat5

# 연습문제
seasons <- matrix(c("봄", "여름", "가을", "겨울"), nrow=2)
seasons
seasons <- matrix(c("봄", "여름", "가을", "겨울"), nrow=2, byrow=T)
seasons

seasons[,2]

seasons2 <- rbind(seasons, c("초봄", "초가을")); seasons2

seasons3 <- cbind(seasons2, c("초여름", "초겨울", "한겨울")); seasons3

# Array
array1 <- array(c(1:12), dim=c(4,3)); array1
array1 <- array(c(1:12), dim=c(4,3), byrow=T)    # byrow 사용 못함
array2 <- array(c(1:12), dim=c(2,2,3))  
array2
array2[1,1,3]
array2[1,,]

# List
list1 <- list(name='홍길동', address='전국', tel='010-2345-6789',
              age=300)
list1
list1$name
list1[1:2]
list1[4]
list1$birth  <- '1719-10-23'  
list1
list1$name <- c('Seojinsu','James Seo')
list1
list1$birth <- NULL
list1
