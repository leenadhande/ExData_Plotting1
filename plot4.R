## Getting full dataset. Assumed that household_power_consumption.txt is present in working directory.
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting the data
subSetPowerData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(subSetPowerData$Date, subSetPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetPowerData$Global_active_power)
globalReactivePower <- as.numeric(subSetPowerData$Global_reactive_power)
voltage <- as.numeric(subSetPowerData$Voltage)
subMetering1 <- as.numeric(subSetPowerData$Sub_metering_1)
subMetering2 <- as.numeric(subSetPowerData$Sub_metering_2)
subMetering3 <- as.numeric(subSetPowerData$Sub_metering_3)



## Plot and Saving to file
par(mfrow = c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()