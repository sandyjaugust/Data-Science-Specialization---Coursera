#plot2.R creates a barplot of pm2.5 emissions in tons for the city of Baltimore by year

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

names(scc) <- tolower(names(scc))
names(scc) <- gsub(".","_",names(scc), fixed=TRUE)

#Subset to Baltimore
df <- smry[smry$fips=="24510",]

#Summarize total emissions by year
te <- df %>% group_by(year) %>% summarize(total_emissions = sum(emissions))

#Create plot
with(te, barplot(total_emissions, ylab = "PM2.5 Emissions (Tons)", xlab = "Year", main = "Total PM2.5 Emissions by Year in Baltimore", names.arg = c("1999","2002","2005","2008"), col = "light blue"))

#Print plot to PNG file
dev.copy(png,"plot2.png")
dev.off()