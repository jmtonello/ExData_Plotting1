data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)

data$DateDMY <- as.Date(data$Date, format="%d/%m/%Y")

smallData <- subset(data, (DateDMY >= as.Date("2007-02-01") & DateDMY <= as.Date("2007-02-02")) )

smallData$DateTime <- strptime(paste(smallData$Date, smallData$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot3.png")


plot(smallData$DateTime, smallData$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(smallData$DateTime, smallData$Sub_metering_2, type = "l", col = "red")
lines(smallData$DateTime, smallData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue"), lty = 1)

dev.off()

