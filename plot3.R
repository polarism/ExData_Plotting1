df <- read.csv('../household_power_consumption.txt',
               sep = ';', 
               na.strings = '?',
               colClasses = c('character', "character", "numeric",
                              "numeric", "numeric","numeric",
                              "numeric", "numeric", "numeric"))
df$Time <- as.POSIXlt(strptime(paste(df$Date, " ", df$Time), '%d/%m/%Y %H:%M:%S'))
df$Date <- as.Date(strptime(df$Date, '%d/%m/%Y'))

start_date <- as.Date('2007-02-01')
end_date <- as.Date('2007-02-02')

days <- df[df$Date >= start_date & df$Date <= end_date,]

y = 'Energy sub metering'

png('plot3.png')
plot(days$Time, days$Sub_metering_1, pch='.', ylab = y, xlab = NA, 
     width = 480,height = 480, units='px')
lines(days$Time, y = days$Sub_metering_1, pch='.')
lines(days$Time, y = days$Sub_metering_2, pch='.', col = 'red')
lines(days$Time, y = days$Sub_metering_3, pch='.', col = 'blue')
legend(x = 'topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
       col = c('black', 'red', 'blue'), lty=c(1,1))
dev.off()
