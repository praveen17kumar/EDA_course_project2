#reading data files.
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

#aggregating Emission column based on year in the NEI file
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

#setting output png file
png('plot1.png')
#plotting and closing the device.
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.off()

