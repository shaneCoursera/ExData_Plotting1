plot2 <- function() {
    
    # read the file and setup DateTime field
    powerFile <- "household_power_consumption.txt"
    rawPower <- read.table(powerFile, header=TRUE, sep=";", na.strings ="?")
    power <- rawPower[(rawPower$Date == "1/2/2007") | (rawPower$Date == "2/2/2007"), ]
    power$DateTime <- strptime(paste(power$Date, ' ', power$Time), '%d/%m/%Y %H:%M:%S')

    png(file="plot2.png")
    par(mfrow = c(1,1), lab=c(3,4,7))   
    
    plot(power$DateTime, power$Global_active_power, type="s", main="", ylim = c(0,8), xlab="", ylab="Global Active Power (kilowatts)")
    
    dev.off()
}

