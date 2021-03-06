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
png(filename = "plot2.png",
    width = 480, height = 480)
plot(importdata$time, importdata$Global_active_power, xlab="",ylab ="Global Active Power (Kilowatts)", type="n")
lines(importdata$time, importdata$Global_active_power,  lty="solid")
dev.off()