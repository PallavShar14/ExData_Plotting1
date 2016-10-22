#Reading the Data
s <- read.table("household_power_consumption.txt",header = TRUE, sep = ";",  colClasses=c(rep("character",2),rep("numeric",7)), na.strings = "?")

#Subsetting the required data
s$Date <- as.Date(as.character(s$Date), "%d/%m/%Y")
dat <- subset(s, (Date>=as.Date(("1/2/2007"), "%d/%m/%Y") & Date <= as.Date(("2/2/2007"), "%d/%m/%Y")))

#Merging date and time in a separate column
datetimes <- paste(dat$Date, dat$Time)
dat$timesta <- as.POSIXct(datetimes)

#Making and saving the plot to a PNG file
png("plot2.png", width = 480, height = 480)
plot(dat$timesta, dat$Global_active_power, type = "l", ylab = "Global Active Power(Kilowatts)", xlab = "")
dev.off()

