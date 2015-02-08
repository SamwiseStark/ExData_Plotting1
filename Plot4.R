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
par(mfrow=c(2,2))
par(mar=c(4,3,3,1.5))
#1
plot(HPC$sno,as.numeric((as.character(HPC$Global_active_power))),type="l",xaxt="n",ylab="Global Avtive Power(kilowatts)",xlab="")
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))
#2
plot(HPC$sno,as.numeric((as.character(HPC$Voltage))),type="l",xaxt="n",ylab="Voltage",xlab="datetime")
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))
#3
plot(HPC$sno,as.numeric((as.character(HPC$Sub_metering_1))),,type="l",xaxt="n",ylab="Energy Sub metering",xlab="",col="black")
lines(HPC$sno,as.numeric((as.character(HPC$Sub_metering_2))),col="red")
lines(HPC$sno,as.numeric((as.character(HPC$Sub_metering_3))),col="blue")
#legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'),cex=0.75,x.intersp=3,y.intersp=1)
legend(1500,40,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('black','red','blue'),cex=0.5,x.intersp=5,y.intersp=1,bty="n")
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))

#4
plot(HPC$sno,as.numeric((as.character(HPC$Global_reactive_power))),type="l",xaxt="n",ylab="Global_reactive_power",xlab="datetime")
axis(1,at=c(1,1441,2880),labels=c("Thu","Fri","Sat"))

dev.copy(png,file="Plot4.png",width = 480, height = 480, units = "px")
dev.off()