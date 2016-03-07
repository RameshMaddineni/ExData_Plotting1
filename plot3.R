#Exploratory_Data_Analysis
householdPCFile <- "C:\\Coursera_Data Scientist\\data.csv\\household_power_consumption.txt"
DT <- read.table(householdPCFile, header=T, sep=";", na.strings="?")
plotDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]
DateTime <- strptime(paste(plotDT$Date, plotDT$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plotDT <- cbind(DateTime, plotDT)
plotDT <- plotDT[, -(2:3)] #remove original columns Date, Time

columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(plotDT$DateTime, plotDT$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(plotDT$DateTime, plotDT$Sub_metering_2, col=columnlines[2])
lines(plotDT$DateTime, plotDT$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid", cex=0.5)


dev.copy(png, file = "C:\\Coursera_Data Scientist\\data.csv\\plot3.png")
dev.off()