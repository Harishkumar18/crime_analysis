library(sqldf)
library(png)
crime <- read.csv('I:\\crime_analysis\\r_part\\crimed.csv',TRUE)

head(crime)


DF=sqldf(" SELECT type_crime,count(*) as total FROM crime group by type_crime order by total desc limit 10")

print(DF) 

DF$Crime_type=as.character(DF$type_crime)

DF$total=as.numeric(DF$total)

png(file = "sta.png")

barplot(DF$total,names.arg=DF$Crime_type,col=rainbow(10),ylab="tot_crimes",cex.names=0.9,las=2,main=" station Road  total  crimes ",ylim=c(5000,357187))
print(DF)
dev.off()  #to shut down all running devices anrd return to this current window

