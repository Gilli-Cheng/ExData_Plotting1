# getwd()
data <- read.table(file = "./household_power_consumption.txt", header = TRUE, 
                   sep = ";", na.strings = "?")
x <- with(data, paste(Date,Time))
x <- strptime(x, "%d/%m/%Y %H:%M:%S")
data <- cbind(x,data)
data <- data[data$x >= "2007-02-01 00:00:00" & data$x < "2007-02-03 00:00:00",]


# data$day <- weekdays(data$x)
# data$day <- strptime(data$day, "%A")


par(mar = c(3,5,4,2))
with(data,plot(x, Global_active_power,ylab = "Global Active Power (kilowatts)"
               ,xlab = "",type = "n"))

lines(data$x, data$Global_active_power, col = "pink")

dev.cur()
dev.copy(png,file = "./plot2.png", height = 480, width = 480, units = "px")
dev.off()
