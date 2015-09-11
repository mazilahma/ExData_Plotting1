setwd("C:/Users/mazilah.amin/Desktop/Coursera/Module 4 Exploratory Data Analysis")
dataFile <- "./household_power_consumption.txt"
mydata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dtpower <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#str(dtpower)

datetime <- strptime(paste(dtpower$Date, dtpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
power <- as.numeric(dtpower$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()