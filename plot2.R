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

#Converting the relevant data to numeric form.
ePwrCons$Global_active_power<-as.numeric(ePwrCons$Global_active_power)

#subsetting the data
ePwrCons3<- subset(ePwrCons, ePwrCons$Date >= as.Date('2007-02-01') & ePwrCons$Date <= as.Date('2007-02-02'))

#Plotting the graph in png format

png("plot2.png", width = 480, height = 480, units = "px")
plot(ePwrCons3$Time, ePwrCons3$Global_active_power,type = 'l', ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
