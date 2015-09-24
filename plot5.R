# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City? 

library(ggplot2)
# 24510 is Baltimore, (plot2.R)

subNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]

agg <- aggregate(Emissions ~ year, subNEI, sum)

png("plot5.png", width=480, height=480)
g <- ggplot(agg, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity", fill="light blue") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions (10^5 Tons)")) +
        ggtitle('Total Emissions from motor vehicle in Baltimore, 1999 to 2008')
print(g)
dev.off()



