#read data in
allData <- read.csv2("household_power_consumption.txt", na.strings = "?", header=TRUE, stringsAsFactors=FALSE)

#create date field with time and subset. Uses library(lubridate)
library(lubridate)
allData$DateTime <- dmy_hms(paste(allData$Date, allData$Time)) 
subsetData <- allData[allData$DateTime >= dmy_hms("01-02-2007 00:00:00") & 
                      allData$DateTime < dmy_hms("03-02-2007 00:00:00"),]

#create 4 plots in a 2 x 2 area
par(mfrow=c(2,2))

#plot1
plot(subsetData$DateTime, subsetData$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type = "l")

#plot2
plot(subsetData$DateTime, subsetData$Voltage, xlab="datetime", ylab="Voltage", type = "l")

#plot3
plot(subsetData$DateTime, subsetData$Sub_metering_1, xlab="", ylab="Energy sub metering", type = "l")
lines(subsetData$DateTime, subsetData$Sub_metering_2, col="red")
lines(subsetData$DateTime, subsetData$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot4
plot(subsetData$DateTime, subsetData$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type = "l")

#save plot as 480x480 png
dev.copy(png, file = 'plot4.png', width=480, height=480)
dev.off()

#reset mfrow back to normal
par(mfrow=c(1,1))

