setClass("date_ddmmyyyy")
setAs("character","date_ddmmyyyy", function(from) as.Date(from, format="%d/%m/%Y"))
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings = "?", colClasses = c("Date"="date_ddmmyyyy"))
smallData <- subset(data, (Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")) )
png("plot1.png")
hist(smallData$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

