plot4 <- function() {
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
     

     
     ## Plot 4
     
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
     
     png(file="plot4.png", width=480, height=480, units="px")
     
     par(mfcol = c(2, 2))
     par(cex = 0.75)
     
     ## graph 1, top left
     plot(myds3$date_time_strp, myds3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
     
     ## graph 2, bottom left
     with(myds3, plot(date_time_strp, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
     with(myds3, lines(date_time_strp, Sub_metering_1, type = "l", col = "black"))
     with(myds3, lines(date_time_strp, Sub_metering_2, type = "l", col = "red"))
     with(myds3, lines(date_time_strp, Sub_metering_3, type = "l", col = "blue"))
     legend("topright", lty = 1, lwd = 1, bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     
     ## graph 3, top right
     plot(myds3$date_time_strp, myds3$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
     
     ## graph 4, bottom right
     plot(myds3$date_time_strp, myds3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
     
     dev.off()
     
}