#read household_power_consumption text file and store in HPC
library(readr)
HPC <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)

#subset plot variable and observations
plot2 <- subset(HPC, Date %in% c("1/2/2007","2/2/2007"))

#convert the Date and Time variables to Date/Time classes
plot2$Date <- as.Date(plot2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(plot2$Date), plot2$Time)
plot2$datetime <- as.POSIXct(datetime)

#Plot 2
with(plot2, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
#save plot2 as png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()