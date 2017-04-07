## Getting full dataset. Assumed that household_power_consumption.txt is present in working directory.
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting the data
subSetPowerData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
datetime <- strptime(paste(subSetPowerData$Date, subSetPowerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetPowerData$Global_active_power)


## Plot and Saving to file
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()