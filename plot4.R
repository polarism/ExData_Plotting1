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

png('plot4.png')

par(mfrow = c(2, 2))
plot(days$Time, days$Global_active_power, pch='.', ylab = 'Global Active Power', xlab = NA)
lines(days$Time, y = days$Global_active_power, pch='.')

plot(days$Time, days$Voltage, pch='.', ylab = 'Voltage', xlab = 'datetime')
lines(days$Time, y = days$Voltage, pch='.')

plot(days$Time, days$Sub_metering_1, pch='.', ylab = 'Energy sub metering', xlab = NA)
lines(days$Time, y = days$Sub_metering_1, pch='.')
lines(days$Time, y = days$Sub_metering_2, pch='.', col = 'red')
lines(days$Time, y = days$Sub_metering_3, pch='.', col = 'blue')

plot(days$Time, days$Global_reactive_power, pch='.', ylab = 'Global_reactive_power', xlab = 'datetime')
lines(days$Time, y = days$Global_reactive_power, pch='.')

dev.off()
