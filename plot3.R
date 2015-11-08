library(png)

mydata <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",header=TRUE)
mynewdata <- subset(mydata,Date %in% c("1/2/2007","2/2/2007"))
mynewdata <- cbind(mynewdata,Timestamp=strptime(paste(mynewdata$Date,mynewdata$Time),"%d/%m/%Y %H:%M:%S"))

png("plot3.png",width=480,height = 480)

plot( mynewdata$Sub_metering_1 ~ mynewdata$Timestamp,type="n",ylab="Entergy sub metering",xlab="",col="black")
lines(mynewdata$Sub_metering_1 ~ mynewdata$Timestamp,col="black")
lines(mynewdata$Sub_metering_2 ~ mynewdata$Timestamp,col="red")
lines(mynewdata$Sub_metering_3 ~ mynewdata$Timestamp,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1)

dev.off()
