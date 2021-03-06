plot1 <- function() {

    # read the file and setup DateTime field
    powerFile <- "household_power_consumption.txt"
    rawPower <- read.table(powerFile, header=TRUE, sep=";", na.strings ="?")
    power <- rawPower[(rawPower$Date == "1/2/2007") | (rawPower$Date == "2/2/2007"), ]
    power$DateTime <- strptime(paste(power$Date, ' ', power$Time), '%d/%m/%Y %H:%M:%S')
    
    #open device to write to png
    png(file="plot1.png")
    par(mfrow = c(1,1), lab=c(4,7,7))    
  
    #start plotting
    hist(power$Global_active_power, col="red", main="Global Active Power", xlim=c(0,6), ylim=c(0,1200), xlab="Global Active Power (kilowatts)")

    #close device  
    dev.off()
}





