# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#load data frame(check plot1.R)
# Use the base plotting 
subsetNEI  <- NEI[NEI$fips=="24510", ]

agg_total_peryear <- aggregate(Emissions ~ year, subsetNEI, sum)

png('plot2.png', width=480,height=480)
barplot(height=agg_total_peryear$Emissions, 
        names.arg=agg_total_peryear$year, 
        xlab="Year", 
        ylab="Total PM 2.5 emissions (tons)",
        main="Total PM 2.5 in Baltimore City")
dev.off()
