#Clear the environment
rm(list=ls())

#Read only the selected data, with the correct headers
data_power <- suppressWarnings(read.table("household_power_consumption.txt", sep= ";",skip=grep("1/2/2007", readLines("household_power_consumption.txt"))-1,nrows = 24*60*2))
data_power.header <- unlist(strsplit(readLines("household_power_consumption.txt",n=1),";"))
colnames(data_power) <- data_power.header

#Process the time
data_power.datetime <- paste(data_power$Date,data_power$Time)
data_power$DateTime <- strptime(data_power.datetime, "%d/%m/%Y %H:%M:%S")

#Plot the different energy sub-metering versus time
plot(data_power$DateTime, data_power$Sub_metering_1,type='l', 
     ylab ="Energy sub metering", xlab="",cex=0.8,cex.axis=0.8 )
lines(data_power$DateTime, data_power$Sub_metering_2,
      type='l', col='red')
lines(data_power$DateTime, data_power$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"), xjust=1, cex=0.8, y.intersp=0.8)

#Save the plot and close the plot thereafter
dev.copy(png,'plot3.png')
dev.off()
