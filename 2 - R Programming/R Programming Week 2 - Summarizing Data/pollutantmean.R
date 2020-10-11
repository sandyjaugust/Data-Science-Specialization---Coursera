pollutantmean <- function(directory, pollutant, id){
    setwd(directory)
    monitordf <- data.frame()
    for(i in id){
        newdf <- read.csv(paste(sprintf("%03d",i),".csv",sep=""))
        monitordf <- rbind(monitordf,newdf)
    }
    mean(monitordf[[pollutant]], na.rm=TRUE)
}