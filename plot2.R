plot2 <- function()
{
  ## Open the graphics device
  png(file = "plot2.png")
  
  ## Read the relevant data in
  powervals <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", skip=66637, nrows=2880)
  
  ## Set the variable names
  colvals <- scan("household_power_consumption.txt", sep=";", nlines=1, what="character")
  colnames(powervals) <- colvals
  
  ## Changing the Date variable to the correct class
  powervals$Date <- as.Date(powervals$Date, format="%d/%m/%Y")
  
  ## Make the plot
  plot(powervals$Global_active_power, type="o", pch = ".", xlab="", ylab="Global Active Power (kilowatts)", xaxt = "n")
  axis(1, at=c(1,1500,2900), lab=c("Thu","Fri","Sat"))
  
  dev.off()
}