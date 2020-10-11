library(dplyr)

if(!dir.exists("Data")){
    dir.create("Data")
}

# Download file from "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# Unzip folder
# Move "household_power_consumption.txt" to the Data directory

# Read data
df <- read.table("Data/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = c("character", "character", "character", "character", "character", "character", "character", "character", "character"))

# Subset to data from 2/1/07 and 2/2/07
df <- filter(df, Date %in% c("1/2/2007", "2/2/2007"))

# Update column classes
df$Date <- as.Date(df$Date, format="%e/%m/%Y")
df$Time <- as.POSIXct(paste(df$Date,df$Time))
df$Global_active_power <- as.numeric(df$Global_active_power)
df$Global_reactive_power <- as.numeric(df$Global_reactive_power)
df$Voltage <- as.numeric(df$Voltage)
df$Global_intensity <- as.numeric(df$Global_intensity)
df$Sub_metering_1 <- as.numeric(df$Sub_metering_1)
df$Sub_metering_2 <- as.numeric(df$Sub_metering_2)
df$Sub_metering_3 <- as.numeric(df$Sub_metering_3)

#Create plot 3
with(df, plot(Time, Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = NA))
with(df, lines(Time, Sub_metering_1))
with(df, lines(Time, Sub_metering_2, col = "red"))
with(df, lines(Time, Sub_metering_3, col = "blue"))
with(df, legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1))

#Print Plot 3 to PNG file
dev.copy(png, "plot3.png")
dev.off()
