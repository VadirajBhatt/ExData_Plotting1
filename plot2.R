library(png)

mydata <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",header=TRUE)
mynewdata <- subset(mydata,Date %in% c("1/2/2007","2/2/2007"))
mynewdata <- cbind(mynewdata,Timestamp=strptime(paste(mynewdata$Date,mynewdata$Time),"%d/%m/%Y %H:%M:%S"))

png("plot2.png",width=480,height = 480)

plot(mynewdata$Global_active_power ~ mynewdata$Timestamp,type="l",ylab="Global Active Power (kilowatts)",xlab="",col="black")

dev.off()
