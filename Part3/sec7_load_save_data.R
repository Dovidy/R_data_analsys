# Load and Save Data
list.files()
scan1 <- scan('scan_1.txt')
scan1
scan2 <- scan('scan_2.txt')    # 1.00  2.00  3.00  4.00
scan2
scan2 <- scan('scan_2.txt', what=""); scan2
scan3 <- scan('scan_3.txt', what=""); scan3
scan4 <- scan('scan_4.txt', what=""); scan4
input <- scan()
input
input <- scan(what="")
input
input3 <- readline()
input3
input4 <- readline("Are you OK? : " )
input5 <- readLines('scan_4.txt')
input5

fruits <- read.table('fruits.txt')
fruits
fruits <- read.table('fruits.txt', header=T)  
fruits
fruit2 <- read.table('fruits_2.txt'); fruit2
fruit2 <- read.table('fruits_2.txt', skip=2); fruit2
fruit2 <- read.table('fruits_2.txt', nrows=2); fruit2  
f2top <- read.table('fruits_2.txt', nrows=2)
f2bottom <- read.table('fruits_2.txt', skip=3)
f2top; f2bottom

fruit3 <- read.csv('fruits_3.csv')
fruit3
fruit4 <- read.csv('fruits_4.csv')    # 헤더가 없는 경우
fruit4
fruit4 <- read.csv('fruits_4.csv', header=F)
fruit4
label <- c('NO','NAME','PRICE','QTY')
fruit4 <- read.csv('fruits_4.csv', header=F, col.names=label)
fruit4

install.packages("googleVis")
library(googleVis)
install.packages("sqldf")
library(sqldf)
Fruits
write.csv(Fruits, "Fruits_sql.csv", quote=F, row.names=F)
fruits_2 <-read.csv.sql("Fruits_sql.csv",
                        sql="SELECT * FROM file WHERE Year = 2008")
fruits_2
fruits_3 <- subset(Fruits, Fruits$Year==2008)
fruits_3

install.packages("XLConnect") 
installed.packages()
library(XLConnect)
data1 <- loadWorkbook("fruits_6.xls", create=T)
data2 <- readWorksheet(data1,sheet="sheet1",
                       startRow=1, endRow=8, startCol=1, endCol=5)
data2

fruits6 <- read.delim("clipboard", header=T)
fruits6

install.packages('readxl')
library(readxl)
fruits7 <- read_excel("fruits_6.xls", # path
  sheet = "Sheet1", # sheet name to read from
  range = "A2:D6", # cell range to read from
  col_names = TRUE, # TRUE to use the first row as column names
  col_types = "guess", # guess the types of columns
  na = "NA") # Character vector of strings to use for missing values
fruits7
