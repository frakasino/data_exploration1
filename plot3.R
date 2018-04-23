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

png(filename = "plot3.png",
    width = 480, height = 480)
plot(importdata$time, importdata$Sub_metering_1, xlab="",ylab ="Energy sub metering", type="n")
lines(importdata$time, importdata$Sub_metering_1,  lty="solid", col="black")
lines(importdata$time, importdata$Sub_metering_2,  lty="solid", col="red")
lines(importdata$time, importdata$Sub_metering_3,  lty="solid", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()