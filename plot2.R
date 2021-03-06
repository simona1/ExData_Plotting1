### Code for producing "plot 2", project 1, in the "Exploratory Research" Coursera class
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

# gap is an abbreaviation for "global active power". Read the respective column into it. 
gap <- selection$Global_active_power

# Open graphics device (in this case png); select the options as required by project instructions.
png(filename="plot2.png", width=480, height=480, units="px", pointsize=12, bg="white", res=NA)

# Plot the graph with the appropriate options.
plot2 <- plot(x=selection$datetime, y=gap, xlab="", ylab="Global Active Power (kilowatts)", type="l")

# Turn graphics device off
dev.off()
