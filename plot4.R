plot4 <- function() {
    
    # read the file and setup DateTime field
    powerFile <- "household_power_consumption.txt"
    rawPower <- read.table(powerFile, header=TRUE, sep=";", na.strings ="?")
    power <- rawPower[(rawPower$Date == "1/2/2007") | (rawPower$Date == "2/2/2007"), ]
    power$DateTime <- strptime(paste(power$Date, ' ', power$Time), '%d/%m/%Y %H:%M:%S')
    
    #open device to write to png
    png(file="plot4.png")
    par(mfrow = c(2,2))
    
    #start plotting
    with(power, {
        plot(DateTime, Global_active_power, type="l", lty=1, xlab="", ylab="Global Active Power")
        
        plot(DateTime, Voltage, type="l", lty=1, xlab="datetime", ylab="Voltage")
        
        plot(DateTime, Sub_metering_1,  type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, type="l",  col="red")
        lines(DateTime, Sub_metering_3, type="l",  col="blue")
        legend("topright", lwd=1, col=c("black", "red", "blue"), bty="n", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        plot(DateTime, Global_reactive_power, type="l", lty=1, xlab="datetime", ylab="Global_reactive_power")
    })
    
    #close device
    dev.off()
}

