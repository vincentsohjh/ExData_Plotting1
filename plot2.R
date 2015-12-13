#Clear the environment
rm(list=ls())

#Read only the selected data, with the correct headers
data_power <- suppressWarnings(read.table("household_power_consumption.txt",sep= ";",skip=grep("1/2/2007", readLines("household_power_consumption.txt"))-1,nrows = 24*60*2))
data_power.header <- unlist(strsplit(readLines("household_power_consumption.txt",n=1),";"))
colnames(data_power) <- data_power.header

#Process the time
data_power.datetime <- paste(data_power$Date,data_power$Time)
data_power$DateTime <- strptime(data_power.datetime, "%d/%m/%Y %H:%M:%S")

#Plot the Global Active Power versus the time
plot(data_power$DateTime, data_power$Global_active_power, type='l',
     ylab="Global Active Power (kilowatts)", xlab="", cex=0.8, cex.axis=0.9)

#Save the plot and close the plot thereafter
dev.copy(png,'plot2.png')
dev.off()