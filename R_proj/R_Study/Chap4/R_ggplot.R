install.packages("ggplot2")
library(ggplot2)

setwd('d:/workspace/R_data_analsys/R_proj/R_study')

korean <- read.table('data/학생별국어성적_new.txt', header=T, sep=',')
korean