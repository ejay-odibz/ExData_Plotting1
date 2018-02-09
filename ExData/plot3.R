#read household_power_consumption text file and store in HPC
library(readr)
HPC <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)

#subset plot variable and observations
plot3 <- subset(HPC, Date %in% c("1/2/2007","2/2/2007"))

#convert the Date and Time variables to Date/Time classes
plot3$Date <- as.Date(plot3$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot3$Date), plot3$Time)
plot3$datetime <- as.POSIXct(datetime)

#plot 3
with(plot3, {
  plot(Sub_metering_1~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Save png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()