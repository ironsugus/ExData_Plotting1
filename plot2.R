
# get data into var d
source("getData.R")

message("set device")
png(filename = "plot2.png", units = "px", width = 480, height = 480) 

message("create plot")
plot(d$t, d$Global_active_power, main = "", ylab = "GLobal Active Power (kilowatts)", xlab = "", type = "l")

message("close png")
dev.off() 


message("done")