plot3 <- function() {
    power <- read.table(powerFile, header=TRUE, sep=";", na.strings ="?")
    
    power$DateTime <- strptime(paste(power$Date, ' ', power$Time), '%d/%m/%Y %H:%M:%S')
    
    par(mfrow = c(1,1))    
    plot(power$DateTime, power$Sub_metering_1,  type="l", xlab="", ylab="Energy sub metering")
    lines(power$DateTime, power$Sub_metering_2, type="l",  col="red")
    lines(power$DateTime, power$Sub_metering_3, type="l",  col="blue")
    legend("topright", lwd=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    dev.copy(png, file="plot3.png")
    
    dev.off()
}

