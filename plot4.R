# read data from file
data <- read.table("household_power_consumption.txt", nrows = 2100000, sep = ";", header=T, as.is=T)

#subset data based on dates
valid <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#create separate vectors of power data to be plotted
power <- as.numeric(valid$Global_active_power)
rpower <- as.numeric(valid$Global_reactive_power)
voltage <- as.numeric(valid$Voltage)


DateTime <- as.POSIXct(paste(valid$Date, valid$Time), format = "%d/%m/%Y %H:%M:%S", tz="EST")

par(mfrow=c(2, 2), mar=c(4, 4, 2, 1), oma=c(0, 0, 2, 0))

png(filename="plot4.png", bg="transparent")

#generate plots on screen device
plot(DateTime, power, type="l", ylab="Global Active Power")

plot(DateTime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(DateTime, valid$Sub_metering_1, type="l", xlab = "", ylab="Energy sub metering")

points(DateTime, valid$Sub_metering_2, type="l", ylab="Global Active Power (kilowatts)", col = "red")

points(DateTime, valid$Sub_metering_3, type="l", ylab="Global Active Power (kilowatts)", col="blue")

legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(DateTime, rpower, type="l", xlab="datetime", ylab="Global_reactive_power")


#close PNG device
dev.off()