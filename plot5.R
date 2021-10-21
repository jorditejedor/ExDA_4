source("~/R/ExDA_4/DownloadData.R")
if(!("pm25" %in% ls())) {
  pm25 <- get_pm25()
}
if(!("ssc" %in% ls())) {
  ssc <- get_ssc()
}

# Question 5
# How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?

library(dplyr)
library(ggplot2)

baltimore <- subset(pm25,fips == "24510")

motorvehicle <- slice(ssc,grep("Vehicle",ssc$EI.Sector))
BMorevehicle <- inner_join(baltimore,motorvehicle)

graph<-ggplot(BMorevehicle,aes(year,Emissions)) +
  stat_summary(fun = sum, geom="line", colour = "red", size = 1) + 
  ggtitle("Motor Vehicle Emissions Evolution in Baltimore City") +
  scale_x_continuous(breaks=seq(1999,2008,by=3)) 

png("plot5.png")
print(graph)
dev.off()

rm(baltimore)
rm(motorvehicle)
rm(BMorevehicle)
rm(graph)