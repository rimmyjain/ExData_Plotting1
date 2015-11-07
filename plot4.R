setwd("G:/my_folders/exploring.data")
pconsump = read.table("household.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
str(pconsump)
subpconsump = pconsump[pconsump$Date %in% c("1/2/2007", "2/2/2007"),]
subpconsump$DateTime = strptime(paste(subpconsump$Date, subpconsump$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with(subpconsump, plot(DateTime, Global_active_power, ylab = "Global Active Power", type = "l"))

with(subpconsump, plot(DateTime, Voltage, xlab = "DateTime", ylab = "Voltage", type = "l"))

with(subpconsump, plot(DateTime, Sub_metering_1, type = 'l', ylab = "Energy sub metering"))
with(subpconsump, lines(DateTime, Sub_metering_2, col = "red"))
with(subpconsump, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

with(subpconsump, plot(DateTime, Global_reactive_power, ylab = "Global Reactive Power", type = "l"))

dev.off()