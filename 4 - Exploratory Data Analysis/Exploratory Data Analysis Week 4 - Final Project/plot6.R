#plot6.r compares bar plots of PM2.5 emissions
#in thousands of tons for the city of Baltimore and for the city of Los Angeles
#by year for vehicle sources

#Load libraries
library(dplyr)
library(ggplot2)

#Load data
smry = readRDS("data/summarySCC_PM25.rds")
scc = readRDS("data/Source_Classification_Code.rds")

#Format data
names(smry) <- tolower(names(smry))
smry$fips <- as.factor(smry$fips)
smry$scc <- as.factor(smry$scc)
smry$pollutant <- as.factor(smry$pollutant)
smry$type <- factor(smry$type, levels = c("NONPOINT","POINT","NON-ROAD","ON-ROAD"))
smry$year <- as.factor(smry$year)

#filter smry to Baltimore and Los Angeles records involving motor vehicle sources
df <- smry %>% filter(type == "ON-ROAD") %>% filter(fips == "24510" | fips == "06037") %>% group_by(fips, year) %>% summarize(total_emissions = sum(emissions))

#Create plot
fipslabs <- c("Los Angeles City","Baltimore City")
names(fipslabs) <- c("06037","24510")
g <- ggplot(data = df, aes(year, total_emissions))
g + facet_grid(.~fips, labeller = labeller(fips=fipslabs)) + geom_bar(stat = "identity") + xlab("Year") + ylab("Total Emissions (Tons)") + ggtitle("Los Angeles vs Baltimore PM2.5 Emissions by Year\nfor Motor Vehicle Sources in Tons")

#Print plot to PNG file
dev.copy(png,"plot6.png")
dev.off()