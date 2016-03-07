#Exploratory_Data_Analysis
householdPCFile <- "C:\\Coursera_Data Scientist\\data.csv\\household_power_consumption.txt"
DT <- read.table(householdPCFile, header=T, sep=";", na.strings="?")
plotDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]
DateTime <- strptime(paste(plotDT$Date, plotDT$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
plotDT <- cbind(DateTime, plotDT)
plotDT <- plotDT[, -(2:3)] #remove original columns Date, Time


plot(plotDT$DateTime, plotDT$Global_active_power, type="l", col="black", xlab="Date", ylab="Global Active Power (kilowatts)")

dev.copy(png, file = "C:\\Coursera_Data Scientist\\data.csv\\plot2.png")
dev.off()