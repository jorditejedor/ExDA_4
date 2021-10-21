source("~/R/ExDA_4/DownloadData.R")
if(!("pm25" %in% ls())) {
  pm25 <- get_pm25()
}

# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland (fips == "24510") from 1999 to 2008? 
# Use the base plotting system to make a plot answering this question.

baltimore <- subset(pm25,fips == "24510")
totalbaltimore <- with(baltimore,tapply(Emissions,year,sum,na.rm=TRUE))

png("plot2.png")
plot(names(totalbaltimore),totalbaltimore,type="o",xlab="Year",ylab="Emissions",xaxt="n")
axis(1,at=seq(1999,2008,by=3))
title(main="Total Emissions per Year in Baltimore City")
dev.off()

rm(baltimore)
rm(totalbaltimore)