#reading data files.
NEI <- readRDS("summarySCC_PM25.rds") 
SCC <- readRDS("Source_Classification_Code.rds")

#subsetting based on flips
subsetNEI  <- NEI[NEI$fips=="24510", ]

#aggregating Emission column based on year in the NEI file
aggregatedTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

#setting output png file
png('plot2.png')

#plotting and closing the device.
barplot(height=aggregatedTotalByYear$Emissions, names.arg=aggregatedTotalByYear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()