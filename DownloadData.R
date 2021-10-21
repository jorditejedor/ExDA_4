get_file<-function(file) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  fileName <- "./data/epa.zip"

  if(!file.exists("data")) {
    dir.create("data")
  }
  if(!file.exists(fileName)) {
    download.file(fileUrl, destfile = fileName, method = "curl")  
    
    dateDownloaded <- date()
    dateDownloaded
  }
  if(!file.exists(file)) {
    unzip(fileName,exdir="./data")
  }
}

get_pm25<-function() {
  file <- "./data/summarySCC_PM25.rds"
  if(!file.exists(file)) {
    get_file(file)
  }
  readRDS(file)
}

get_ssc<-function() {
  file = "./data/Source_Classification_Code.rds"
  if(!file.exists(file)) {
    get_file(file)
  }
  readRDS(file)
}

