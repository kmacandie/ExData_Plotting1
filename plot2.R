# read data from file
data <- read.table("household_power_consumption.txt", nrows = 2100000, sep = ";", header=T, as.is=T)

#subset data based on dates
valid <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#create separate vector of power data to be plotted
power <- as.numeric(as.character(valid$Global_active_power))

DateTime <- as.POSIXct(paste(valid$Date, valid$Time), format = "%d/%m/%Y %H:%M:%S", tz="EST")

#generate plot on screen device
plot(DateTime, power, type="l", ylab="Global Active Power (kilowatts)")

# copy plot to png file
dev.copy(png, file = "plot2.png")

#close PNG device
dev.off()