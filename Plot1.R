dataFile <- "./household_power_consumption.txt"
mydata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dtpower <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#str(dtpower)
power <- as.numeric(dtpower$Global_active_power)
png("plot1.png", width=480, height=480)
hist(power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
