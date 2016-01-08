# install.packages("sqldf")
library(sqldf)
#setwd("./exData_Plotting1")

PROF = F

getData <- function(){
    message("check for subset file")
    if (file.exists("household_power_consumption_subset.txt")){
        message("read subset data file")
        f <- read.csv2(file = "household_power_consumption_subset.txt")
    }else{
        message("read data from file")
        f <- read.csv2.sql("household_power_consumption.txt", sql = 'select * from file where Date in ("1/2/2007", "2/2/2007")')
        closeAllConnections()
        
        message("write file")
        write.csv2(f, file = "household_power_consumption_subset.txt")
    }
    message("format data")
    c <- paste(f$Date, f$Time)
    t <- strptime(c, "%d/%m/%Y %H:%M:%S")
    d <<- cbind(t, f)
    
}

if(PROF) Rprof()

getData()

if(PROF) Rprof(NULL)
#summaryRprof()