##Load Data in R Environment
household_power_consumption <- read.csv("C:/Users/thier/OneDrive/Bureau/Data Science/RProjects/JHU/EDA/ExData_Plotting1/household_power_consumption.txt", sep=";")


##Keep only relevant Data (1/2/2007 and 2/2/2007)
household_power_consumption_Clean <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date =="2/2/2007")

##Convert Date and Time column from Character to Date & Time format
household_power_consumption_Clean$Date <- as.Date(household_power_consumption_Clean$Date, format="%d/%m/%Y")
household_power_consumption_Clean$Time <- strptime(household_power_consumption_Clean$Time, format="%H:%M:%S")
household_power_consumption_Clean[1:1440,"Time"] <- format(household_power_consumption_Clean[1:1440,"Time"],"2007-02-01 %H:%M:%S")
household_power_consumption_Clean[1441:2880,"Time"] <- format(household_power_consumption_Clean[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

##Set parameters for 2x2 Plots
par(mfrow=c(2,2))

##Create Plot4 then copy it into a .png file
with(household_power_consumption_Clean,{
  plot(household_power_consumption_Clean$Time,as.numeric(as.character(household_power_consumption_Clean$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(household_power_consumption_Clean$Time,as.numeric(as.character(household_power_consumption_Clean$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(household_power_consumption_Clean$Time,household_power_consumption_Clean$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(household_power_consumption_Clean,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(household_power_consumption_Clean,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(household_power_consumption_Clean,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(household_power_consumption_Clean$Time,as.numeric(as.character(household_power_consumption_Clean$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.copy(png, file = "Plot4.png")
dev.off()