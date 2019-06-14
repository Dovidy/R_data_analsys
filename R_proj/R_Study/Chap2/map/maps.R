install.packages('ggiraphExtra')
install.packages('maps')

library(ggiraphExtra)
library(maps)
library(tibble)
library(ggplot2)
library(dplyr)
library(reshape2)
library(grid)
library(gridExtra)


str(USArrests)
head(USArrests)
tail(USArrests)
summary(USArrests)

crime <- rownames_to_column(USArrests, var='state')
head(crime)
crime$state <- tolower(crime$state)

states_map <- map_data('state')
str(states_map)

m <- ggChoropleth(data = crime, aes(fill=Murder, map_id=state), map=states_map)
r <- ggChoropleth(data = crime, aes(fill=Rape, map_id=state), map=states_map)
a <- ggChoropleth(data = crime, aes(fill=Assault, map_id=state), map=states_map)
u <- ggChoropleth(data = crime, aes(fill=UrbanPop, map_id=state), map=states_map)

grid.arrange(m, r, a, u, nrow=2)