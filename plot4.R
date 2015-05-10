#Setting Working Directory
setwd('../W1')
getwd()

#Reading the data
ePwrCons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses = "character")

#Checking what the data contains and data types
str(ePwrCons)
head(ePwrCons)

#Converting the Date and Time to appropriate form
ePwrCons$Time <- strptime(paste(ePwrCons$Date, ePwrCons$Time," "),"%d/%m/%Y %H:%M:%S")
ePwrCons$Date <- as.Date(ePwrCons$Date, "%d/%m/%Y")


#subsetting the data
ePwrCons3<- subset(ePwrCons, ePwrCons$Date >= as.Date('2007-02-01') & ePwrCons$Date <= as.Date('2007-02-02'))

#Converting the relevant data to numeric form.
ePwrCons3$Global_active_power<-as.numeric(ePwrCons3$Global_active_power)
ePwrCons3$Global_reactive_power<-as.numeric(ePwrCons3$Global_reactive_power)
ePwrCons3$Voltage<-as.numeric(ePwrCons3$Voltage)
ePwrCons3$Global_intensity<-as.numeric(ePwrCons3$Global_intensity)
ePwrCons3$Sub_metering_1<-as.numeric(ePwrCons3$Sub_metering_1)
ePwrCons3$Sub_metering_2<-as.numeric(ePwrCons3$Sub_metering_2)
ePwrCons3$Sub_metering_3<-as.numeric(ePwrCons3$Sub_metering_3)


#Plotting the graph in png format

png("plot4.png", width = 480, height = 480, units = "px")

par(mfcol=c(2,2))
plot(ePwrCons3$Time, ePwrCons3$Global_active_power,type = 'l', ylab = "Global Active Power", xlab="")

plot(ePwrCons3$Time, ePwrCons3$Sub_metering_1, type = 'l', ylab = "Energy sub metering", xlab = "")
lines(ePwrCons3$Time, ePwrCons3$Sub_metering_2, col = "red")
lines(ePwrCons3$Time, ePwrCons3$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"),lwd = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n", cex = 0.95)

plot(ePwrCons3$Time, ePwrCons3$Voltage,type = 'l', ylab = "Voltage", xlab="datetime")

plot(ePwrCons3$Time, ePwrCons3$Global_reactive_power,type = 'l', ylab = "Global_reactive_power", xlab="datetime")

dev.off()
