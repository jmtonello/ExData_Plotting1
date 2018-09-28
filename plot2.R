data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", stringsAsFactors = FALSE)

data$DateDMY <- as.Date(data$Date, format="%d/%m/%Y")

smallData <- subset(data, (DateDMY >= as.Date("2007-02-01") & DateDMY <= as.Date("2007-02-02")) )

smallData$DateTime <- strptime(paste(smallData$Date, smallData$Time), format = "%d/%m/%Y %H:%M:%S")

png("plot2.png")

with(smallData, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.off()

