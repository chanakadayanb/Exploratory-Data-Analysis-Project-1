# Read Data
ESM <- read.table("household_power_consumption.txt",skip=1,sep=";")
# Naming  Data 
names(ESM) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting
subset_esm <- subset(ESM,ESM$Date=="1/2/2007" | ESM$Date =="2/2/2007")

# varibale date and time  Transforming
subset_esm$Date <- as.Date(subset_esm$Date, format="%d/%m/%Y")
subset_esm$Time <- strptime(subset_esm$Time, format="%H:%M:%S")
subset_esm[1:1440,"Time"] <- format(subset_esm[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subset_esm[1441:2880,"Time"] <- format(subset_esm[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# create plot 
plot(subset_esm$Time,subset_esm$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subset_esm,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subset_esm,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subset_esm,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")
