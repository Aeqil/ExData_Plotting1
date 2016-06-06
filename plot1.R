plot1 <- function()
{
  ## Open the graphics device
  png(file = "plot1.png")
  
  ## Read the relevant data in
  powervals <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", skip=66637, nrows=2880)
  
  ## Set the variable names
  colvals <- scan("household_power_consumption.txt", sep=";", nlines=1, what="character")
  colnames(powervals) <- colvals
  
  ## Changing the Date variable to the correct class
  powervals$Date <- as.Date(powervals$Date, format="%d/%m/%Y")
  
  with(powervals, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", col="red"))
  
  title(main= "Global Active Power")
  
  dev.off()
}