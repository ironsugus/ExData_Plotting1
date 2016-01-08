
# get data into var d
source("getData.R")

message("set device")
png(filename = "plot4.png", units = "px", width = 480, height = 480) 
par(mfrow = c(2, 2))

message("create plot 1")
plot(d$t, d$Global_active_power, main = "", ylab = "GLobal Active Power", xlab = "", type = "l")

message("create plot 2")
plot(d$t, d$Voltage, main = "", ylab = "Voltage", xlab = "datetime", type = "l")

message("create plot 3")
plot(d$t, d$Sub_metering_1, col = "black", main = "", type = "l", xlab = "", ylab = "Energy sub metering")
lines(d$t, d$Sub_metering_2, col = "red")
lines(d$t, d$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1, bty = "n")

message("create plot 4")
plot(d$t, d$Global_reactive_power, main = "", ylab = "Global_reactive_power", xlab = "datetime", type = "l")


message("close png")
dev.off() 

message("done")