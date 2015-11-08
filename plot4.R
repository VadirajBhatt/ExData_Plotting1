library(png)

mydata <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",header=TRUE)
mynewdata <- subset(mydata,Date %in% c("1/2/2007","2/2/2007"))
mynewdata <- cbind(mynewdata,Timestamp=strptime(paste(mynewdata$Date,mynewdata$Time),"%d/%m/%Y %H:%M:%S"))

png("plot4.png",width=480,height = 480)

par(mfcol=c(2,2),mar=c(4,4,2,2))

plot(mynewdata$Global_active_power ~ mynewdata$Timestamp,type="l",ylab="Global Active Power (kilowatts)",xlab="",col="black")

plot( mynewdata$Sub_metering_1 ~ mynewdata$Timestamp,type="n",ylab="Entergy sub metering",xlab="",col="black")
lines(mynewdata$Sub_metering_1 ~ mynewdata$Timestamp,col="black")
lines(mynewdata$Sub_metering_2 ~ mynewdata$Timestamp,col="red")
lines(mynewdata$Sub_metering_3 ~ mynewdata$Timestamp,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")

plot(mynewdata$Voltage ~ mynewdata$Timestamp,xlab="datetime",ylab="Voltage",type="l")

plot(mynewdata$Global_reactive_power ~ mynewdata$Timestamp,xlab="datetime",ylab="Global_reactive_power",type="l")

dev.off()