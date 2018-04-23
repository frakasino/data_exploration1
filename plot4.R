importdata <- read.table("household_power_consumption.txt",
                         header=T, 
                         sep = ";")
importdata[,1]<-as.Date(importdata$Date, format="%d/%m/%Y")
importdata<- subset(importdata, Date>="2007-02-01" & 
                      Date<="2007-02-02")
head(importdata$Date)
tail(importdata$Date)
importdata$time<-paste(importdata$Date, importdata$Time)
importdata$time <- strptime(importdata$time, 
                            "%Y-%m-%d %H:%M:%S")
importdata$Global_active_power <- as.character(importdata$Global_active_power)
importdata$Global_active_power <- as.double(importdata$Global_active_power)

importdata$Sub_metering_1 <- as.character(importdata$Sub_metering_1)
importdata$Sub_metering_1 <- as.double(importdata$Sub_metering_1)

importdata$Sub_metering_2 <- as.character(importdata$Sub_metering_2)
importdata$Sub_metering_2 <- as.double(importdata$Sub_metering_2)

importdata$Sub_metering_3 <- as.character(importdata$Sub_metering_3)
importdata$Sub_metering_3 <- as.double(importdata$Sub_metering_3)

importdata$Voltage <- as.character(importdata$Voltage)
importdata$Voltage <- as.double(importdata$Voltage)

importdata$Global_reactive_power <- as.character(importdata$Global_reactive_power)
importdata$Global_reactive_power <- as.double(importdata$Global_reactive_power)


png(filename = "plot4.png",
    width = 480, height = 480)
par(mfrow=c(2,2), mar=c(5,5,2,2))
plot(importdata$time, importdata$Global_active_power, xlab="",ylab ="Global Active Power", type="n")
lines(importdata$time, importdata$Global_active_power,  lty="solid")

plot(importdata$time, importdata$Voltage, xlab="datetime",ylab ="Voltage", type="n")
lines(importdata$time, importdata$Voltage,  lty="solid")

plot(importdata$time, importdata$Sub_metering_1, xlab="",ylab ="Energy sub metering", type="n")
lines(importdata$time, importdata$Sub_metering_1,  lty="solid", col="black")
lines(importdata$time, importdata$Sub_metering_2,  lty="solid", col="red")
lines(importdata$time, importdata$Sub_metering_3,  lty="solid", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

plot(importdata$time, importdata$Global_reactive_power, xlab="datetime",ylab ="Global_reactive_power", type="n")
lines(importdata$time, importdata$Global_reactive_power,  lty="solid")
dev.off()