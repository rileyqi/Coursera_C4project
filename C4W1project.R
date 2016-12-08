#load file
fulldata<-read.csv(file.choose(), header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
#fulldata$datetime<-paste(fulldata$Date,fulldata$Time)
#fulldata$dt<-strptime(datetime, "%m/%d/%y %H:%M:%S")
#fulldata$datetime<-as.Date(fulldata$datetime, format="%m/%d/%y %H:%M:%S")
fulldata$Date<-as.Date(fulldata$Date, format = "%d/%m/%Y")
dates<-as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data<-subset(fulldata, Date %in% dates)

