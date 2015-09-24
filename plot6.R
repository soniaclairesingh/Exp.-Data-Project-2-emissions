# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, 
# California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
rm(list = ls())
#load data
if(!exists("NEI")){
        NEI <- readRDS("/Users/soniasingh/Desktop/Coursera/Data Science Specialization/exdata_data_NEI_data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("/Users/soniasingh/Desktop/Coursera/Data Science Specialization/exdata_data_NEI_data/Source_Classification_Code.rds")
}
library(ggplot2)

# Gather the subset of the NEI data for vehicles
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
v_SCC <- SCC[vehicles,]$SCC
v_NEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data by each city's fip & add city name.
v_BaltimoreNEI <- v_NEI[vehiclesNEI$fips=="24510",]
v_BaltimoreNEI$city <- "Baltimore City"

v_LANEI <- v_NEI[v_NEI$fips=="06037",]
v_LANEI$city <- "Los Angeles County"

# join the two subsets with city name -> single data frame
bothNEI <- rbind(v_BaltimoreNEI,vehiclesLANEI)

png("plot6.png",width=480,height=480)

library(ggplot2)

ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill=year),stat="identity") +
        facet_grid(scales="free", space="free", .~city) +
        guides(fill=FALSE) + theme_grey() +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (kt)")) + 
        labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions in Baltimore & LA, 1999-2008"))

print(ggp)

dev.off()