#Download and Clean Data
if(!file.exists("CourseraData")){
  
  dir.create("CourseraData")
}
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,destfile="./CourseraData/household_power_consumption.txt",method="curl")
HousePower<-read.table("./CourseraData/household_power_consumption.txt",header=TRUE,sep=';')
HPC<-HousePower[as.Date(HousePower$Date,"%d/%m/%Y") >=as.Date("01/02/2007","%d/%m/%Y") & as.Date(HousePower$Date,"%d/%m/%Y") <= as.Date("02/02/2007","%d/%m/%Y"),]
HPC$sno<-c(1:2880)
#Analyze our Data
head(HPC)
sapply(HPC, class)

#PLOT
par(mfrow=c(1,1))
hist(as.numeric((as.character(HPC$Global_active_power))), col='red',main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",xlim=c(0,6))
dev.copy(png,file="Plot1.png",width = 480, height = 480, units = "px")
dev.off()
