# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
rm(list = ls())
if(!exists("NEI")){
        NEI <- readRDS("/Users/soniasingh/Desktop/Coursera/Data Science Specialization/exdata_data_NEI_data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("/Users/soniasingh/Desktop/Coursera/Data Science Specialization/exdata_data_NEI_data/Source_Classification_Code.rds")
}

if(!exists("NEISCC")){
        NEISCC <- merge(NEI, SCC, by="SCC")
}

library(ggplot2)

coalMatches  <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
subsetNEISCC <- NEISCC[coalMatches, ]

agg <- aggregate(Emissions ~ year, subsetNEISCC, sum)

png("plot4.png", width=480, height=480)
g <- ggplot(agg, aes(factor(year), Emissions/10^5))
g <- g + geom_bar(stat="identity", fill="blue") +
        xlab("year") +
        ylab(expression('Total PM'[2.5]*" Emissions(10^5 Tons)")) +
        ggtitle('Total Emissions from U.S. coal sources, 1999 to 2008')
print(g)
dev.off()

