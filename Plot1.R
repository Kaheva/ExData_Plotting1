##Load Data in R Environment
household_power_consumption <- read.csv("C:/Users/thier/OneDrive/Bureau/Data Science/RProjects/JHU/EDA/ExData_Plotting1/household_power_consumption.txt", sep=";")


##Keep only relevant Data (1/2/2007 and 2/2/2007)
household_power_consumption_Clean <- subset(household_power_consumption,household_power_consumption$Date=="1/2/2007" | household_power_consumption$Date =="2/2/2007")


##Create Plot1 then copy it into a .png file
with(household_power_consumption_Clean, hist(as.numeric(as.character(household_power_consumption_Clean$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)"))
dev.copy(png, file = "Plot1.png")
dev.off()

