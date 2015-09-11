setwd("C:/Users/mazilah.amin/Desktop/Coursera/Module 4 Exploratory Data Analysis")
dataFile <- "./household_power_consumption.txt"
mydata <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
dtpower <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

str(dtpower)

datetime <- strptime(paste(dtpower$Date, dtpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)

power <- as.numeric(dtpower$Global_active_power)
submeter1 <- as.numeric(dtpower$Sub_metering_1)
submeter2 <- as.numeric(dtpower$Sub_metering_2)
par(mfrow=c(2,2))

plot(datetime, dtpower$Global_active_power, type="l",xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, dtpower$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime,submeter1,type="l", xlab="", ylab="Energy Sub Metering")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, dtpower$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"), cex=0.8, col=c("black", "red","blue"), lty=1)

plot(datetime, dtpower$Global_reactive_power, type="l",xlab="datetime", ylab="Global Reactive Power (kilowatts)")
dev.off()