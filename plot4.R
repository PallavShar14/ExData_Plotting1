#Reading the Data
s <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",  colClasses=c(rep("character",2),rep("numeric",7)), na.strings = "?")

#Making the required subset
s$Date <- as.Date(as.character(s$Date), "%d/%m/%Y")
dat <- subset(s, (Date>=as.Date(("1/2/2007"), "%d/%m/%Y") & Date <= as.Date(("2/2/2007"), "%d/%m/%Y")))

#making an additional column which merges date and time
datetimes <- paste(dat$Date, dat$Time)
dat$timesta <- as.POSIXct(datetimes)

#Making and saving the plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(dat$timesta, dat$Global_active_power, type = "l", ylab = "Global Active Power(Kilowatts)", xlab = "")
plot(dat$timesta, dat$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
plot(dat$timesta, dat$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dat$timesta, dat$Sub_metering_2, type = "l", col = "red")
lines(dat$timesta, dat$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, lwd = 1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dat$timesta, dat$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
dev.off()
