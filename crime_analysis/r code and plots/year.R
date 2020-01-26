crime <- read.csv('I:\\crime_analysis\\r_part\\crimed.csv',TRUE)

head(crime)

library(sqldf)

DF=sqldf(" SELECT Month,count(*) as total FROM crime where Area='Thiruvottiyur' group by Month order by total desc limit 10  ")

print(DF) 

DF$Month=as.character(DF$Month)

DF$total=as.numeric(DF$total)

png(file = "pri12.png")

barplot(DF$total,names.arg=DF$Month,col=rainbow(10),ylab="tot_crimes",cex.names=0.9,las=2,main=" crimes in months",ylim=c(0,400))

print(DF)
dev.off()

