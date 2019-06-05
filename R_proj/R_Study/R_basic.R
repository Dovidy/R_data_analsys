install.packages('sqldf')
library(sqldf)
library(googleVis)
library

Fruits # googleVis default var
write.csv(Fruits, "data/Fruits_sql.csv", quote=F, row.names=F)

sqldf('SELECT * FROM Fruits')
sqldf('SELECT * FROM Fruits WHERE Fruits=\'apple\'')

sqldf('SELECT * FROM Fruits LIMIT 0, 5')
sqldf('SELECT * FROM Fruits LIMIT 5') #SAME
sqldf('SELECT * FROM Fruits LIMIT 3, 5')

sqldf('SELECT * FROM Fruits ORDER BY Year')
sqldf('SELECT * FROM Fruits ORDER BY Year DESC')

sqldf('SELECT Fruits, sum(Sales) FROM Fruits GROUP BY Fruits')
sqldf('SELECT Fruits, sum(Sales), SUM(Expenses), sum(Profit) 
          FROM Fruits 
          GROUP BY Fruits')
sqldf('SELECT Fruits, sum(Sales), SUM(Expenses), sum(Profit) 
          FROM Fruits 
          GROUP BY Year')
sqldf('SELECT Year, AVG(Sales), AVG(Expenses), AVG(Profit) FROM Fruits GROUP BY YEAR ORDER BY AVG(Profit) DESC')
sqldf('SELECT min(Sales), max(Sales) FROM Fruits')

sqldf('SELECT * FROM Fruits where Sales=81')
sqldf('SELECT MIN(Sales) FROM Fruits')
sqldf('SELECT * FROM Fruits where Sales=(SELECT MIN(Sales) FROM Fruits)')

sqldf('SELECT * FROM Fruits where Expenses=(SELECT MAX(Expenses) FROM Fruits)')
sqldf('SELECT * FROM Fruits where Sales IN ')

song <- read.csv('data/song.csv', header=F, fileEncoding='utf8')
names(song) <- c('_id', 'title', 'lyrics', 'girl_group_id')
song

girl_group <- read.csv('data/girl_group.csv', header=F, fileEncoding = 'utf8')
names(girl_group) <- c('_id', 'name', 'debut')
girl_group

sqldf('SELECT gg._id, gg.name, gg.debut, s.title
          FROM girl_group as gg
          INNER JOIN song as s
          ON gg._id = s.girl_group_id')


sqldf('UPDATE Fruits SET Profit=50 WHERE Fruit=\'Apples\' AND YEAR=2008') # NOT FETCHED TO DB
sqldf('SELECT * FROM Fruits')
sqldf(c('UPDATE Fruits SET Profit=50 WHERE Fruit=\'Apples\' AND Year=2008', 'SELECT * FROM Fruits'))