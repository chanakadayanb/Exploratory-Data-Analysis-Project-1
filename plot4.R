# Reading Data
final_plot <- read.table("household_power_consumption.txt",skip=1,sep=";")
#naming Data
names(final_plot) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#subsetting
subset_final <- subset(final_plot,final_plot$Date=="1/2/2007" | final_plot$Date =="2/2/2007")

# Transforming # varibale date and time  Transforming
subset_final$Date <- as.Date(subset_final$Date, format="%d/%m/%Y")
subset_final$Time <- strptime(subset_final$Time, format="%H:%M:%S")
subset_final[1:1440,"Time"] <- format(subset_final[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_final[1441:2880,"Time"] <- format(subset_final[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Muty grahp enabling
par(mfrow=c(2,2))

# creating plot 
with(subset_final,{
  plot(subset_final$Time,as.numeric(as.character(subset_final$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subset_final$Time,as.numeric(as.character(subset_final$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subset_final$Time,subset_final$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subset_final,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subset_final,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subset_final,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subset_final$Time,as.numeric(as.character(subset_final$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})

