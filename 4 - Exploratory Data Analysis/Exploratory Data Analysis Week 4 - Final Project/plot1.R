#plot1.r builds a barplot showing US total PM2.5 emissions by year in tons for
#1999, 2002, 2005, and 2008

#Load libraries
library(dplyr)

#Load data
smry = readRDS("data/summarySCC_PM25.rds")
scc = readRDS("data/Source_Classification_Code.rds")

#Format data
names(smry) <- tolower(names(smry))
smry$fips <- as.factor(smry$fips)
smry$scc <- as.factor(smry$scc)
smry$pollutant <- as.factor(smry$pollutant)
smry$type <- as.factor(smry$type)
smry$year <- as.factor(smry$year)

#Summarize emmissions by year
df <- smry %>% group_by(year) %>% summarize(total_emissions = sum(emissions))

#Create plot
with(df, barplot(total_emissions/1000, ylab = "PM2.5 Emissions (Thousands of Tons)", xlab = "Year", main = "Total PM2.5 Emissions by Year in the USA", names.arg = c("1999","2002","2005","2008"), col = "light blue"))

#Print plot to PNG
dev.copy(png,"plot1.png")
dev.off()