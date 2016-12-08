#load file
fulldata<-read.csv(file.choose(), header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
fulldata$Date<-as.Date(fulldata$Date, format = "%d/%m/%Y")
dates<-as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data<-subset(fulldata, Date %in% dates)

#plot2
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)',type='l')
dev.off()
