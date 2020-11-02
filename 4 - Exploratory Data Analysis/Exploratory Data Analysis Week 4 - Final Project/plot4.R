#plot4.r creates a faceted bar plot, showing PM2.5 emissions
#in thousands of tons for the US by year for coal combustion emitters

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

names(scc) <- tolower(names(scc))
names(scc) <- gsub(".","_",names(scc), fixed=TRUE)

#get scc identifiers for measurements involving coal combustion
coal <- scc %>% filter(grepl("coal",ei_sector,ignore.case = TRUE)) %>% select(scc)

#filter smry to records involving coal combustion
df <- smry %>% filter(scc %in% coal$scc) %>% group_by(year) %>% summarize(total_emissions = sum(emissions))

#Create plot
g <- ggplot(data = df, aes(year, total_emissions/1000))
g + geom_bar(stat = "identity") + xlab("Year") + ylab("Total Emissions (Thousands of Tons)") + ggtitle("US PM2.5 Emissions by Year for Coal Combustion Sources in Tons")

#Print plot to PNG file
dev.copy(png,"plot4.png")
dev.off()