
# get data into var d
source("getData.R")

message("set device")
png(filename = "plot3.png", units = "px", width = 480, height = 480) 

message("create plot")
plot(d$t, d$Sub_metering_1, col = "black", main = "", type = "l", xlab = "", ylab = "Energy sub metering")
lines(d$t, d$Sub_metering_2, col = "red")
lines(d$t, d$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

message("close png")
dev.off() 


message("done")