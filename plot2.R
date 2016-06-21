#read data in
allData <- read.csv2("household_power_consumption.txt", na.strings = "?", header=TRUE, stringsAsFactors=FALSE)

#create date field with time and subset. Uses library(lubridate)
library(lubridate)
allData$DateTime <- dmy_hms(paste(allData$Date, allData$Time)) 
subsetData <- allData[allData$DateTime >= dmy_hms("01-02-2007 00:00:00") & 
                      allData$DateTime < dmy_hms("03-02-2007 00:00:00"),]

#create plot
plot(subsetData$DateTime, subsetData$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type = "l")

#save plot as 480x480 png
dev.copy(png, file = 'plot2.png', width=480, height=480)
dev.off()