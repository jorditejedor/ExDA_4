source("~/R/ExDA_4/DownloadData.R")
if(!("pm25" %in% ls())) {
  pm25 <- get_pm25()
}

# Question 1 
# Have total emissions from PM2.5 decreased in the United States from 1999 
# to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission 
# from all sources for each of the years 1999, 2002, 2005, and 2008.

totalem <-with(pm25,tapply(Emissions,year,sum,na.rm=TRUE))

png("plot1.png")
plot(names(totalem),totalem,type="o",xlab="Year",ylab="Emissions",xaxt="n")
axis(1,at=seq(1999,2008,by=3))
title(main="Total Emissions per Year in US")
dev.off()

rm(totalem)