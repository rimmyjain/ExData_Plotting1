setwd("G:/my_folders/exploring.data")
pconsump = read.table("household.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE, dec = ".")
str(pconsump)
subpconsump = pconsump[pconsump$Date %in% c("1/2/2007", "2/2/2007"),]

subpconsump$Global_active_power=as.numeric(subpconsump$Global_active_power)

png("plot1.png", width=480, height=480)
with(subpconsump, hist(Global_active_power, col = "red", xlab = "Global_active_power (Kilowatts)", main = "Global_active_power"))
dev.off()