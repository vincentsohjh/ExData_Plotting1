setwd('C:/Users/Vincent Soh/Documents/ExData_Plotting1')

rm(list=ls())

data_power<-read.table("household_power_consumption.txt", sep= ";",skip=grep("1/2/2007", readLines("household_power_consumption.txt"))-1,nrows = 24*60*2)

data_power.header <- unlist(strsplit(readLines("household_power_consumption.txt",n=1),";"))

colnames(data_power) <- data_power.header

data_power.datetime <- paste(data_power$Date,data_power$Time)
data_power$DateTime <- strptime(data_power.datetime, "%d/%m/%Y %H:%M:%S")


plot(data_power$DateTime, data_power$Sub_metering_1,type='l', 
     ylab ="Energy sub metering", xlab="")
lines(data_power$DateTime, data_power$Sub_metering_2,
      type='l', col='red')
lines(data_power$DateTime, data_power$Sub_metering_3,type='l', col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("black","red","blue"), xpd = TRUE,y.intersp = 0.8,cex=1)

