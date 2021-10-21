source("~/R/ExDA_4/DownloadData.R")
if(!("pm25" %in% ls())) {
  pm25 <- get_pm25()
}
if(!("ssc" %in% ls())) {
  ssc <- get_ssc()
}

# Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips=="06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

BMore_vs_LA <- subset(pm25,fips == "24510" | fips == "06037")

motorvehicle <- slice(ssc,grep("Vehicle",ssc$EI.Sector))

BMore_vs_LA <- inner_join(BMore_vs_LA,motorvehicle)

city.labs <- c("Los Angeles", "Baltimore City")
names(city.labs) <- c("06037","24510")

graph<-ggplot(BMore_vs_LA,aes(year,Emissions)) +
  stat_summary(fun = sum, geom="line", colour = "red", size = 1) + 
  facet_grid(. ~ fips ,labeller=labeller(fips=city.labs)) +  
  ggtitle("Vehicle Emission Comparison") +
  scale_x_continuous(breaks=seq(1999,2008,by=3)) 

png("plot6.png")
print(graph)
dev.off()

rm(BMore_vs_LA)
rm(motorvehicle)
rm(city.labs)
rm(graph)