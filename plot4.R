#load file
fulldata<-read.csv(file.choose(), header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
fulldata$Date<-as.Date(fulldata$Date, format = "%d/%m/%Y")
dates<-as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data<-subset(fulldata, Date %in% dates)

#plot
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, xlab = '', ylab = 'Global Active Power',type='l')
plot(data$DateTime, data$Voltage, xlab = 'datetime', ylab = 'Voltage',type='l')
plot(data$DateTime, data$Sub_metering_1, xlab = '', ylab = 'Energy sub metering',type='l')
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1, bty='n')
plot(data$DateTime, data$Global_reactive_power, xlab = 'datetime', ylab = 'Global_Reactive_Power',type='l')
dev.off()
