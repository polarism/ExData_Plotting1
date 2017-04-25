df <- read.csv('../household_power_consumption.txt',
               sep = ';', 
               na.strings = '?',
               colClasses = c('character', "character", "numeric",
                              "numeric", "numeric","numeric",
                              "numeric", "numeric", "numeric"))
df$Date <- as.Date(strptime(df$Date, '%d/%m/%Y'))


start_date <- as.Date('2007-02-01')
end_date <- as.Date('2007-02-02')

days <- df[df$Date >= start_date & df$Date <= end_date,]

title = "Global Active Power"
x = 'Global Active Power (kilowatts)'
y = 'Frequency'

png('plot1.png')
hist(days$Global_active_power, col = 'red', 
     main = title, xlab = x, ylab = y)
dev.off()
