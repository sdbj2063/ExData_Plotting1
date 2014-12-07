plot2 <- function() {
     ## Coursera and Johns Hopkins University
     ## Exploratory Data Analysis
     ## Project 1
     
     ## Data File used:
     ## Bache, K. & Lichman, M. (2013). UCI Machine Learning Repository 
     ## [http://archive.ics.uci.edu/ml]. Irvine, CA: University of California, School of Information 
     ## and Computer Science.
     ## https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption
     ## Data used is Feb 1-2, 2007
     
     ## Code assumes the data file is unzipped into your working directory. Data file is 
     ## "household_power_consumption.txt."
     
     ## Executed on R version 3.1.1, Windows 8
     
     ## Plot 2
     
     library("utils")
     library("grDevices")
     myfile <- "household_power_consumption.txt"
     myds2 <- read.delim(myfile, header=FALSE, sep=";",nrows=2880, skip=66637)
     myhead <- c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
     colnames(myds2) <- myhead
     myds3 <- myds2
     myds3$Date <- as.Date(myds3$Date, "%d/%m/%Y")
     myds3$date_time <- paste(myds3$Date, as.character(myds3$Time))
     myds3$date_time_strp <- strptime(myds3$date_time, format = "%F %T")     
     
     png(file="plot2.png", width=480, height=480, units="px")
     plot(myds3$date_time_strp, myds3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
     dev.off()
     
}