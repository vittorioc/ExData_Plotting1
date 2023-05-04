download.file("https://d396qusza40orc.cloudfront.net/exdata/data/household_power_consumption.zip", destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")
data <- read.csv("household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";")
data <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]

data$Date <- as.POSIXct(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
plot(data$Global_active_power ~ data$Date, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()