library(ggplot2)
View(mpg)
library(dplyr)

mpg %>%
  filter(manufacturer %in% c('audi', 'toyota')) %>%
  group_by(manufacturer) %>%
  summarise(고속도로연비평균=mean(hwy))

mpg %>%
  filter(manufacturer %in% c('chevrolet','ford','honda')) %>%
  group_by(manufacturer) %>%
  summarise(cty_avg = mean(cty))

mpg %>%
  mutate(avg_spd = (cty + hwy) / 2) %>%
  group_by(class) %>%
  summarise(class별평균속도 = mean(avg_spd)) %>%
  arrange(desc(class별평균속도)) %>%
  head(5)
mpg %>%
  group_by(class) %>%
  summarise(class별평균속도 = mean((cty + hwy) / 2)) %>%
  arrange(desc(class별평균속도)) %>%
  head(5)

mpg %>%
  mutate(avg_spd = (cty + hwy) / 2) %>%
  select(manufacturer, class, cty, hwy, avg_spd) %>%
  head(5)

mtcars %>%
  mutate(mpg_per_disp = (mpg /disp)) %>%
  arrange(desc(mpg_per_disp)) %>%
  head(5)

mtcars %>%
  group_by(cyl) %>%
  summarise(avg_hp = mean(hp)) %>%
  arrange(desc(avg_hp))

mtcars %>%
  group_by(cyl) %>%
  summarise_each(list(mean), disp, hp)

mtcars %>%
  group_by(cyl) %>%
  summarise_each(funs(mean, n()), disp, hp)

iris %>%
  group_by(Species) %>%
  summarise_each(list(mean), Sepal.Length, Sepal.Width,
                 Petal.Length, Petal.Width)
