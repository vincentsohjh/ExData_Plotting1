#Clear the environment
rm(list=ls())

#Read only the selected data, with the correct headers
data_power<- suppressWarnings(read.table("household_power_consumption.txt", sep= ";",skip=grep("1/2/2007", readLines("household_power_consumption.txt"))-1,nrows = 24*60*2))
data_power.header <- unlist(strsplit(readLines("household_power_consumption.txt",n=1),";"))
colnames(data_power) <- data_power.header


#Plot the histrogram
hist(data_power$Global_active_power,main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red",cex=0.8)

#Save the histogram and close the plot
dev.copy(png,'plot1.png')
dev.off()
