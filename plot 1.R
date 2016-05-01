setwd("C:/Users/apple/Desktop")
if(!file.exists('data')) dir.create('data')
fileUrl <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(fileUrl, destfile = 'C:/Users/apple/Desktop/data/household_power_consumption.zip')
unzip('C:/Users/apple/Desktop/data/household_power_consumption.zip', exdir = 'C:/Users/apple/Desktop/data')

# read data into R
files <- file('C:/Users/apple/Desktop/data/household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=TRUE), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot 1
# open device
if(!file.exists('figures')) dir.create('figures')
png(filename = 'C:/Users/apple/Desktop/figures/plot1.png', width = 480, height = 480, units='px')
# plot figure
with(data, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', main = 'Global Active Power', col = 'red'))
# close device
dev.off()


