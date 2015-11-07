setwd("G:/my_folders/exploring.data")
pconsump = read.table("household.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
str(pconsump)
subpconsump = pconsump[pconsump$Date %in% c("1/2/2007", "2/2/2007"),]
subpconsump$DateTime = strptime(paste(subpconsump$Date, subpconsump$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(subpconsump$Global_active_power)
png("plot2.png", width=480, height=480) 
with(subpconsump, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()


  
