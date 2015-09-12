plot1 <- function() {

  power <- read.table(powerFile, header=TRUE, sep=";", na.strings ="?")

  par(mfrow = c(1,1))    
  hist(power$Global_active_power, col="red", main="Global Active Power", xlim=c(0,6),ylim=c(0,1200), xlab="Global Active Power (kilowatts)")
  
  dev.copy(png, file="plot1.png")
  
  dev.off()
}





