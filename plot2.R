#Plot2

#Setting up a directory, dowloading and unzipping the file
setwd("~/r.PROJECTS/R_dir") 
if(!file.exists("./DSCourse_4_Assignment_1")) dir.create("./DSCourse_4_Assignment_1")
setwd("~/r.PROJECTS/R_dir/DSCourse_4_Assignment_1")
fileUrl <- ("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
download.file(fileUrl, destfile = "household_power_consumption.zip")
unZip <- unzip("household_power_consumption.zip")


#Read data into R
hpc <- file('household_power_consumption.txt')
data <- read.table(text = grep("^[1,2]/2/2007",readLines(hpc), value=TRUE), sep = ';', 
                   col.names = c("Date", 
                                 "Time", 
                                 "Global_active_power", 
                                 "Global_reactive_power", 
                                 "Voltage", "Global_intensity", 
                                 "Sub_metering_1", 
                                 "Sub_metering_2", 
                                 "Sub_metering_3"), na.strings = '?')

#Coverting and Formating Data
data$Date <- as.Date(data$Date, format = '%d/%m/%Y')
data$DateTime <- as.POSIXct(paste(data$Date, data$Time))

#Creating Plot2
png(filename = 'plot2.png', width = 480, height = 480, units='px')

            plot(data$DateTime, 
                 data$Global_active_power, 
                 xlab = '', 
                 ylab = 'Global Active Power (kilowatt)', 
                 type = 'l')


dev.off()