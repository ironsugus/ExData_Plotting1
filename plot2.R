# install.packages("sqldf")
library(sqldf)

getData <- function(){
    message("check for subset file")
    if (file.exists("household_power_consumption_subset.txt")){
        message("read subset data file")
        f <- read.csv2(file = "household_power_consumption_subset.txt")
    }else{
        message("download data")
        if(!file.exists("DATA")) {
            fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
            download.file(fileUrl, "data.zip")
            unzip("data.zip", exdir = "DATA")
        }
        message("read data from file")
        f <- read.csv2.sql("DATA/household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")')
        closeAllConnections()
        message("write file")
        write.csv2(f, file = "household_power_consumption_subset.txt")
    }
    message("format data")
    c <- paste(f$Date, f$Time)
    t <- strptime(c, "%d/%m/%Y %H:%M:%S")
    d <<- cbind(t, f)
    
}

getData()

message("set device")
png(filename = "plot2.png", units = "px", width = 480, height = 480) 

message("create plot")
plot(d$t, d$Global_active_power, main = "", ylab = "GLobal Active Power (kilowatts)", xlab = "", type = "l")

message("close png")
dev.off() 


message("done")