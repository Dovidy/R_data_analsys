install.packages('stringi')
install.packages('devtools')
devtools::install_github('cardiomoon/kormaps2014')

library(kormaps2014)
library(dplyr)
library(ggiraphExtra)
library(maps)
library(reshape2)
library(ggplot2)
library(tibble)
library(grid)
library(gridExtra)

str(changeCode(korpop1))

korpop1 <- rename(korpop1,
                  pop=총인구_명,
                  name=행정구역별_읍면동)

str(changeCode(korpop1))
str(changeCode(korpop2))
head(changeCode(tbc))

ggChoropleth(data=korpop1, aes(fill=pop, map_id=code, tooltip=name), map=kormap1, interactive = T)
ggChoropleth(data=korpop2, aes(fill=총인구_명, map_id=code, tooltip=name), map=kormap2, interactive = T)
ggChoropleth(data=tbc, aes(fill=NewPts, map_id=code, tooltip=name), map=kormap1, interactive = T)
