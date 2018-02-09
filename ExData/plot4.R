#read household_power_consumption text file and store in HPC
library(readr)
HPC <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)

plot4 <- subset(HPC, Date %in% c("1/2/2007","2/2/2007"))

#convert the Date and Time variables to Date/Time classes
plot4$Date <- as.Date(plot4$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot4$Date), plot4$Time)
plot4$datetime <- as.POSIXct(datetime)

#PLOT 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(plot4, {
  plot(Global_active_power~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
# Save as png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()