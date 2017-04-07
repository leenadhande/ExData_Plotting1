## Getting full dataset
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subsetting the data
subSetPowerData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


## Plot and Saving to file
globalActivePower <- as.numeric(subSetPowerData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()