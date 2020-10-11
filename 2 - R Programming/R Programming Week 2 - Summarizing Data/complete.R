complete <- function(directory, id = 1:332){
    setwd(directory)
    completedf <- data.frame()
    for(i in id){
        newdf2 <- na.omit(read.csv(paste(sprintf("%03d",i),".csv",sep="")))
        nobs <- nrow(newdf2)
        newrow <- cbind(i,nobs)
        completedf <- rbind(completedf,newrow)
    }
    return(completedf)
}