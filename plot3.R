plot3 <- function()
{
  ## Open the graphics device
  png(file = "plot3.png")
  
  ## Read the relevant data in
  powervals <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", skip=66637, nrows=2880)
  
  ## Set the variable names
  colvals <- scan("household_power_consumption.txt", sep=";", nlines=1, what="character")
  colnames(powervals) <- colvals
  
  ## Changing the Date variable to the correct class
  powervals$Date <- as.Date(powervals$Date, format="%d/%m/%Y")
  
  ## Make the plot
  barplot(powervals$Sub_metering_1, type="o")
  points(powervals$Sub_metering_3, col="blue", pch="|", type="o")
  points(powervals$Sub_metering_2, col="red", pch="|", type="o")
  
  axis(1, at=c(1,1500,2900), lab=c("Thu","Fri","Sat"))
  
  legend("topright", pch="-", col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  dev.off()
}