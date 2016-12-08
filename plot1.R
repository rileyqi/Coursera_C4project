#load file
fulldata<-read.csv(file.choose(), header = T, sep = ";", na.strings = "?", stringsAsFactors = F)
fulldata$Date<-as.Date(fulldata$Date, format = "%d/%m/%Y")
dates<-as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data<-subset(fulldata, Date %in% dates)

#plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()
