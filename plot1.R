#Exploratory_Data_Analysis
householdPCFile <- "C:\\Coursera_Data Scientist\\data.csv\\household_power_consumption.txt"
DT <- read.table(householdPCFile, header=T, sep=";", na.strings="?")
plotDT <- DT[DT$Date %in% c("1/2/2007","2/2/2007"),]
Date <- as.Date(strptime(paste(plotDT$Date, plotDT$Time, sep=" "),"%d/%m/%Y %H:%M:%S"))
plotDT <- cbind(Date, plotDT)
plotDT <- plotDT[, -(2:3)] #remove original columns Date, Time

hist(plotDT$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.copy(png, file = "C:\\Coursera_Data Scientist\\data.csv\\plot1.png")
dev.off()