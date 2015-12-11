setwd('C:/Users/Vincent Soh/Documents/ExData_Plotting1')

rm(list=ls())

data_power<-read.table("household_power_consumption.txt", sep= ";",skip=grep("1/2/2007", readLines("household_power_consumption.txt"))-1,nrows = 24*60*2)

data_power.header <- unlist(strsplit(readLines("household_power_consumption.txt",n=1),";"))

colnames(data_power) <- data_power.header

hist(data_power$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
