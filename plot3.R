## Getting full dataset. Assumed that household_power_consumption.txt is present in working directory.
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting the data
subSetPowerData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


datetime <- strptime(paste(subSetPowerData$Date, subSetPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetPowerData$Global_active_power)
subMetering1 <- as.numeric(subSetPowerData$Sub_metering_1)
subMetering2 <- as.numeric(subSetPowerData$Sub_metering_2)
subMetering3 <- as.numeric(subSetPowerData$Sub_metering_3)



## Plot and Saving to file
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()