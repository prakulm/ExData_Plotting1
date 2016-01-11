
## Read raw file
household_full_file <- read.table(file = "Coursera_R\\Exploratory Data Analysis\\household_power_consumption.txt", header = TRUE, sep =";",stringsAsFactors = FALSE)
## Select working dataset
household_dataset <- household_full_file[household_full_file$Date == "1/2/2007" | household_full_file$Date == "2/2/2007", ]

## Process Data
household_dataset$Global_active_power <- as.numeric(household_dataset$Global_active_power)
household_dataset$Global_reactive_power <- as.numeric(household_dataset$Global_reactive_power)
household_dataset$Voltage <- as.numeric(household_dataset$Voltage)
household_dataset$Global_intensity <- as.numeric(household_dataset$Global_intensity)
household_dataset$Sub_metering_1 <- as.numeric(household_dataset$Sub_metering_1)
household_dataset$Sub_metering_2 <- as.numeric(household_dataset$Sub_metering_2)
household_dataset$Sub_metering_3 <- as.numeric(household_dataset$Sub_metering_3)


## Create Datetime variable
household_dataset$day1 <- strptime(paste(as.Date(household_dataset$Date,"%d/%m/%Y"), " ", household_dataset$Time), format = "%Y-%m-%d %H:%M:%S")

## Create png file and plot graph
png(filename = "plot2.png", width = 480, height = 480)
with(household_dataset, plot(day1, Global_active_power, xlab = "" , ylab = "Global Active Power (kilowatts)", type = "l"))
dev.off()
