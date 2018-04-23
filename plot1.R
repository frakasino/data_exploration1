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
png(filename = "plot1.png",
    width = 480, height = 480)
hist(importdata$Global_active_power, col="red", 
     xlab = "Global Active Power (Kilowatts)", 
     ylab ="Frequency", main=paste("Global Active Power"), 
     right=T)
dev.off()

