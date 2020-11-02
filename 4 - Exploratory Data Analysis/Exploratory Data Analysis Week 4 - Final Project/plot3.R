#plot3.r creates a faceted bar plot, showing PM2.5 emissions
#in tons for the city of Baltimore by year and by measurement source

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

#Subset to Baltimore
df <- smry[smry$fips=="24510",]

#Summarize total emissions by year and by type
te <- df %>% group_by(type,year) %>% summarize(total_emissions = sum(emissions))

#Create plot
g <- ggplot(data = te, aes(year, total_emissions))
g + facet_grid(. ~ type) + geom_bar(stat = "identity") + xlab("Year") + ylab("Total Emissions (Tons)") + ggtitle("Baltimore PM2.5 Emissions by Year by Source Type in Tons")

#Print plot to PNG file
dev.copy(png,"plot3.png")
dev.off()