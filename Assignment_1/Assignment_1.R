dados <- read.table("./Assignment_1/household_power_consumption.txt",header=TRUE,sep=";",)
View(dados)

library(dplyr)
dados1 <- filter (dados,Date=="1/2/2007"|Date=="2/2/2007")
View(dados1)

library(lubridate)
dados1 <- mutate(dados1,Global_active_power=as.numeric(Global_active_power), Global_reactive_power=as.numeric(Global_reactive_power),Voltage=as.numeric((Voltage)))
data <- as.POSIXct(paste(dados1$Date, dados1$Time), format="%d/%m/%Y %H:%M:%S")


View(data)

dev.cur()

png(file="plot1.png")
hist(dados1$Global_active_power,col = "red",xlab = "Global Active Power (killowats)",main="Global Active Power")
dev.off()


png(file="plot2.png")
plot(data,dados1$Global_active_power,ylab = "Global Active Power (killowats)",xlab="",type = "l")
dev.off()

png(file="plot3.png")
plot(data,dados1$Sub_metering_1,xlab="",ylab = "Energy sub metering",type = "l")
lines(data,dados1$Sub_metering_2,col="red")
lines(data,dados1$Sub_metering_3,col="blue")
legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()

png(file="plot4.png")
par(mfrow=c(2,2))
plot(data,dados1$Global_active_power,ylab = "Global Active Power",xlab="",type = "l")
plot(data,dados1$Voltage,ylab = "Voltage",xlab="datetime",type = "l")

plot(data,dados1$Sub_metering_1,xlab="",ylab = "Energy sub metering",type = "l")
lines(data,dados1$Sub_metering_2,col="red")
lines(data,dados1$Sub_metering_3,col="blue")
legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(data,dados1$Global_reactive_power,ylab = "Global_reactive_power",xlab="datetime",type = "l")
dev.off()

