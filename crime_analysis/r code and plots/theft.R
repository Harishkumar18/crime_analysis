#install.packages("sqldf")
library(sqldf)
crime <- read.csv('I:\\crime_analysis\\r_part\\crimed.csv',TRUE)

head(crime)

DF=sqldf(" SELECT Area,count(*) as total FROM crime where type_crime='Thefts'
 group by Area order by total desc limit 10 ")

print(DF) 

DF$Area=as.character(DF$Area)

DF$total=as.numeric(DF$total)

png(file = "loc.png")

barplot(DF$total,names.arg=DF$Area,col=rainbow(10),ylab="tot_crimes",cex.names=0.9,las=2,main=" Location wise   total vechile crimes ",ylim=c(0,1000))

print(DF)
dev.off()

