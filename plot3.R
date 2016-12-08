#load file
fulldata<-read.csv(file.choose(), header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
fulldata$Date<-as.Date(fulldata$Date, format = "%d/%m/%Y")
dates<-as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data<-subset(fulldata, Date %in% dates)

#plot2
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering',type='l')
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
# close device
dev.off()
