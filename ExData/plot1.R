#read household_power_consumption text file and store in HPC
library(readr)
HPC <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, trim_ws = TRUE)

#subset plot variable and observations
plot1 <- subset(HPC, Date %in% c("1/2/2007","2/2/2007"))
#convert date variable
plot1$Date <- as.Date(plot1$Date, format="%d/%m/%Y")

#plot1 histogram
hist(plot1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#save plot1 as png
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()