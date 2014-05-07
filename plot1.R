# read data from file
data <- read.table("household_power_consumption.txt", nrows = 2100000, sep = ";", header=T)

# change "Date" from factor to Date format
data$Date = as.Date(data$Date, format = "%d/%m/%Y")

#subset data based on dates
valid <- subset(data, data$Date == "2007-02-01" | data$Date == "2007-02-02")

#create separate vector of power data to be plotted
power <- as.numeric(as.character(valid$Global_active_power))

#generate plot on screen device
hist(power, col = "red", xlab="Global Active Power (kilowatts)", main="Global Active Power")

# copy plot to png file
dev.copy(png, file = "plot1.png", bg="transparent")

#close PNG device
dev.off()