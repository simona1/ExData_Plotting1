### Code for producing "plot 3", project 1, in the "Exploratory Research" Coursera class
### This script assumes that the destination file "household_power_consumption.txt" has been 
### downloaded into the working directory

# Read data from file into the hpcdata data frame with the appropriate options. 
hpcdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 2075259, stringsAsFactors=FALSE)

# Convert variable "Date" into class.
hpcdata$Date <- as.Date(hpcdata$Date, "%d/%m/%Y")

# Subset for the dates of interest and store into data frame called "selection".
selection <- hpcdata[hpcdata$Date=="2007-02-01" | hpcdata$Date=="2007-02-02", c(1:9)]

# Create a new variable/column called "datetime" from the Date and Time column contents.
selection$datetime <- paste(selection$Date, selection$Time)

# Process the new variable with strptime()
selection$datetime <- strptime(selection$datetime, "%Y-%m-%d %H:%M:%S")

# Subset the data to be plotted
s1 <- selection$Sub_metering_1
s2 <- selection$Sub_metering_2
s3 <- selection$Sub_metering_3

# Open graphics device (in this case png); select the options as required by project instructions.
png(filename="plot3.png", width=480, height=480, units="px", pointsize=12, bg="white", res=NA)

plot3 <- plot(x=selection$datetime, s1, col="black", type="l", ylim=range(s1), ylab= "Energy sub metering", xlab="")
par(new=TRUE)
plot3 <- plot(x=selection$datetime, s2, xaxt="n", yaxt="n", col="red", type="l", ylim=range(s1), ylab= "Energy sub metering", xlab="")
par(new=TRUE)
plot3 <- plot(x=selection$datetime, s3, xaxt="n", yaxt="n", col="blue", type="l", ylim=range(s1), ylab= "Energy sub metering", xlab="")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(2.5,2.5), col=c("black","red", "blue"), cex=0.9)

# Turn graphics device off
dev.off()


