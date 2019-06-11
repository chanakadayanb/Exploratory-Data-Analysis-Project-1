#read Data
GAP_time <- read.table("household_power_consumption.txt",skip=1,sep=";")

# Naming Data
names(GAP_time) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subseting
sibset_gaptime <- subset(GAP_time,GAP_time$Date=="1/2/2007" | GAP_time$Date =="2/2/2007")

# varibale date and time  Transforming
sibset_gaptime$Date <- as.Date(sibset_gaptime$Date, format="%d/%m/%Y")
sibset_gaptime$Time <- strptime(sibset_gaptime$Time, format="%H:%M:%S")
sibset_gaptime[1:1440,"Time"] <- format(sibset_gaptime[1:1440,"Time"],"2007-02-01 %H:%M:%S")
sibset_gaptime[1441:2880,"Time"] <- format(sibset_gaptime[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Creating plot
plot(sibset_gaptime$Time,as.numeric(as.character(sibset_gaptime$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")