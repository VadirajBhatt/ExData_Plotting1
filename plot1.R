library(png)

mydata <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",header=TRUE)
mynewdata <- subset(mydata,Date %in% c("1/2/2007","2/2/2007"))
mynewdata <- cbind(mynewdata,Timestamp=strptime(paste(mynewdata$Date,mynewdata$Time),"%d/%m/%Y %H:%M:%S"))

png("plot1.png",width=480,height = 480)

hist(mynewdata$Global_active_power,main = "Global Active Power",xlab = "Global Active Power (kilowatts)",col="red")

dev.off() 
