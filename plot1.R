#Reading the Data
s <- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

#Converting Character string to Date
s$Date <- as.Date(as.character(s$Date), "%d/%m/%Y")

#Subsetting the data for two days
dat <- subset(s, (Date>=as.Date(("1/2/2007"), "%d/%m/%Y") & Date <= as.Date(("2/2/2007"), "%d/%m/%Y")))

#Making and saving the histogram to a PNG file
png("plot1.png", width = 480, height = 480)
hist(dat$Global_active_power,xlab = "Global Active Power(kilowatts)", ylab = "Frequency", ylim = c(0,1200),main = "Global Active Power", col = "red")
dev.off()