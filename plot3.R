source("~/R/ExDA_4/DownloadData.R")
if(!("pm25" %in% ls())) {
  pm25 <- get_pm25()
}

# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, 
# onroad, nonroad) variable, which of these four sources have seen 
# decreases in emissions from 1999–2008 for Baltimore City? Which have seen 
# increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

baltimore <- subset(pm25,fips == "24510")

library(ggplot2)

graph<-ggplot(baltimore,aes(year,Emissions)) + 
  stat_summary(fun = sum, geom="line", colour = "red", size = 1) +
  facet_grid(cols=vars(type)) +
  scale_x_continuous(breaks=seq(1999,2008,by=3),labels=c("99","02","05","08")) +
  ggtitle("Baltimore City evolution by type of source")

png("plot3.png")
  print(graph)
dev.off()

rm(baltimore)
rm(graph)