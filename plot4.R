#4
hpcheaders <- read.csv('./household_power_consumption.txt',sep=';',nrows=1,header=F)
hpcheaders <- as.character(lapply(hpcheaders[1,],as.character))
hpc <- read.csv('./household_power_consumption.txt',sep=';',skip=66636,nrows=2880,header=T,col.names=hpcheaders)#66637:69516
hpc$Date <- as.Date(hpc$Date,format='%d/%m/%Y')
hpc$Time <- as.character(lapply(hpc$Time,as.character))
hpc$datetime <- strptime(paste(hpc$Date,hpc$Time),format='%Y-%m-%d %H:%M:%S')

png(filename='plot4.png')

par(mfrow=c(2,2))

plot(hpc$datetime,hpc$Global_active_power,type='l',xlab='',ylab='Global Active Power')
plot(hpc$datetime,hpc$Voltage,type='l',ylab='Voltage',xlab='datetime')
plot(hpc$datetime,hpc$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
points(hpc$datetime,hpc$Sub_metering_2,type='l',col='red')
points(hpc$datetime,hpc$Sub_metering_3,type='l',col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),lty=1,
       col=c('black','red','blue'),bty='n',
       cex=1)
plot(hpc$datetime,hpc$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power',lwd=.01)

dev.off()