#Exploratory_Data_Analysis
householdPCFile <- "C:\\Coursera_Data Scientist\\data.csv\\household_power_consumption.txt"
DT <- read.table(householdPCFile, header=T, sep=";", na.strings="?")
plotDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]
DateTime <- strptime(paste(plotDT$Date, plotDT$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plotDT <- cbind(DateTime, plotDT)
plotDT <- plotDT[, -(2:3)] #remove original columns Date, Time

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(plotDT$DateTime, plotDT$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(plotDT$DateTime, plotDT$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(plotDT$DateTime, plotDT$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(plotDT$DateTime, plotDT$Sub_metering_2, type="l", col="red")
lines(plotDT$DateTime, plotDT$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines, cex=0.5)
plot(plotDT$DateTime, plotDT$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")


dev.copy(png, file = "C:\\Coursera_Data Scientist\\data.csv\\plot4.png")
dev.off()