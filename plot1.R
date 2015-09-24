# setwd("/Users/soniasingh/Desktop/Coursera/Data Science Specialization")

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system
if(!exists("NEI")){
        NEI <- readRDS("/Users/soniasingh/Desktop/Coursera/Data Science Specialization/exdata_data_NEI_data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("/Users/soniasingh/Desktop/Coursera/Data Science Specialization/exdata_data_NEI_data/Source_Classification_Code.rds")
}

agg_total_peryear <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png', width=480,height=480)
barplot(height=agg_total_peryear$Emissions/10^6, 
        names.arg=agg_total_peryear$year, 
        xlab="Year", 
        ylab="Total PM 2.5 (10^6 Tons) emissions", 
        main="U.S.Total PM 2.5 emissions by Year")
dev.off()