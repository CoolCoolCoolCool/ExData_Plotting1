#1
hpcheaders <- read.csv('./household_power_consumption.txt',sep=';',nrows=1,header=F)
hpcheaders <- as.character(lapply(hpcheaders[1,],as.character))
hpc <- read.csv('./household_power_consumption.txt',sep=';',skip=66636,nrows=2880,header=T,col.names=hpcheaders)#66637:69516
hpc$Date <- as.Date(hpc$Date,format='%d/%m/%Y')

png(filename='plot1.png')
hist(x=hpc$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)',ylab='Frequency')
dev.off()
