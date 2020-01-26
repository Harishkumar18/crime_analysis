crime <- read.csv('I:\\crime_analysis\\r_part\\crimed.csv',TRUE)

head(crime)

library(sqldf)
DF=sqldf(" SELECT area,count(*) as total FROM crime  group by area order by total desc limit 10  ")

print(DF) 

DF$area=as.character(DF$Area)

DF$total=as.numeric(DF$total)


barplot(DF$total,names.arg=DF$area,col=rainbow(10),ylab="tot_crimes",cex.names=0.9,las=2,main=" which is max crime",ylim=c(0,25000))

print(DF)
dev.off()

