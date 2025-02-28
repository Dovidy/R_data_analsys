count <- read.csv("data/연도별요양기관별보험청구금액_2004_2013_세로.csv",
                  stringsAsFactors = FALSE)
colname <- count$년도


v1 <- count[,2]/1000000
v2 <- count[,3]/1000000
v3 <- count[,4]/1000000
v4 <- count[,5]/1000000
v5 <- count[,6]/1000000
v6 <- count[,7]/1000000
v7 <- count[,8]/1000000
v8 <- count[,9]/1000000
v9 <- count[,10]/1000000
v10 <- count[,11]/1000000
  
plot(v1,xlab="",ylab="",ylim=c(0,10000),axes=FALSE,col="violet",type="o",lwd=2,
       main=paste("연도별 요양 기관별 보험 청구 금액 현황(단위:백만원)","\n", 
       "출처:건강보험심사평가원"))
axis(1,at=1:10,label=colname,las=2)
axis(2,las=1)

lines(v2 ,col="blue",type="o",lwd=2)
lines(v3 ,col="red",type="o",lwd=2)
lines(v4 ,col="black",type="o",lwd=2)
lines(v5 ,col="orange",type="o",lwd=2)
lines(v6 ,col="green",type="o",lwd=2)
lines(v7 ,col="cyan",type="o",lwd=2)
lines(v8 ,col="yellow",type="o",lwd=2)
lines(v9 ,col="brown",type="o",lwd=2)
lines(v10 ,col="navy",type="o",lwd=2)
abline(h=seq(0,15000,1000),v=seq(1,100,1),lty=3,lwd=0.2)
col <- names(count[1,2:11])
colors <- c("violet","blue","red","black","orange","green","cyan","yellow","brown","navy")
legend(1,10000,col,cex=0.8,col=colors,lty=1,lwd=2,bg="white")
