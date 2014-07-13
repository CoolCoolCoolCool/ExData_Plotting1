#2
hpcheaders <- read.csv('./household_power_consumption.txt',sep=';',nrows=1,header=F)
hpcheaders <- as.character(lapply(hpcheaders[1,],as.character))
hpc <- read.csv('./household_power_consumption.txt',sep=';',skip=66636,nrows=2880,header=T,col.names=hpcheaders)#66637:69516
hpc$Date <- as.Date(hpc$Date,format='%d/%m/%Y')
hpc$Time <- as.character(lapply(hpc$Time,as.character))
hpc$datetime <- strptime(paste(hpc$Date,hpc$Time),format='%Y-%m-%d %H:%M:%S')
png(filename='plot2.png')
plot(hpc$datetime,hpc$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()