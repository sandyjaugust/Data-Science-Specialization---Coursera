#plot5.r creates a faceted bar plot, showing PM2.5 emissions
#in thousands of tons for the city of Baltimore by year for vehicle sources

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

#filter smry to Baltimore records involving motor vehicle sources
df <- smry %>% filter(type == "ON-ROAD") %>% filter(fips == "24510") %>% group_by(year) %>% summarize(total_emissions = sum(emissions))

#Create plot
g <- ggplot(data = df, aes(year, total_emissions))
g + geom_bar(stat = "identity") + xlab("Year") + ylab("Total Emissions (Tons)") + ggtitle("Baltimore PM2.5 Emissions by Year for Motor Vehicle Sources in Tons")

#Print plot to PNG file
dev.copy(png,"plot5.png")
dev.off()