source("~/R/ExDA_4/DownloadData.R")
if(!("pm25" %in% ls())) {
  pm25 <- get_pm25()
}
if(!("ssc" %in% ls())) {
  ssc <- get_ssc()
}

# Question 4  
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

library(dplyr)
library(ggplot2)

coal <- slice(ssc,grep("Coal$",ssc$EI.Sector))
pm25coal<- inner_join(pm25,coal)

graph<-ggplot(pm25coal,aes(year,Emissions)) +
  stat_summary(fun = sum, geom="line", colour = "red", size = 1) + 
  ggtitle("Coal combustion-related evolution in US") +
  scale_x_continuous(breaks=seq(1999,2008,by=3))

png("plot4.png")
print(graph)
dev.off()

rm(graph)
rm(coal)
rm(pm25coal)