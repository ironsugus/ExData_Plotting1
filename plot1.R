
# get data into var d
source("getData.R")

message("set device")
png(filename = "plot1.png", units = "px", width = 480, height = 480) 

message("create plot")
hist(d$Global_active_power, main = "Global Active Power", xlab = "GLobal Active Power (kilowatts)", col = "red")

message("close png")
dev.off() 

message("done")