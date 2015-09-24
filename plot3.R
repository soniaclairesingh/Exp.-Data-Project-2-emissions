# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

if(!exists("NEI")){
        NEI <- readRDS("/Users/soniasingh/Desktop/Coursera/Data Science Specialization/exdata_data_NEI_data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
        SCC <- readRDS("/Users/soniasingh/Desktop/Coursera/Data Science Specialization/exdata_data_NEI_data/Source_Classification_Code.rds")
}
B_NEI <- NEI[NEI$fips=="24510",]

# Aggregate using sum the Baltimore emissions data by year
agg_B <- aggregate(Emissions ~ year, B_NEI,sum)

png("plot3.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

ggp <- ggplot(B_NEI,aes(factor(year),Emissions,fill=type)) +
        geom_bar(stat="identity") +
        theme_grey() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free") + 
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
        labs(title=expression("Emissions, Baltimore City 1999-2008 by Source"))

print(ggp)

dev.off()