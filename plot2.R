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

y = 'Global Active Power (kilowatts)'

png('plot2.png')
plot(days$Time, days$Global_active_power, pch='.', ylab = y, xlab = NA, 
     width = 480,height = 480, units='px')
lines(days$Time, y = days$Global_active_power, pch='.')
dev.off()
