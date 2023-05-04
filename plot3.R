download.file("https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip", destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
data$Date <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

plot(data$Sub_metering_1 ~ data$Date, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$Sub_metering_2 ~ data$Date, col = "red")
lines(data$Sub_metering_3 ~ data$Date, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()