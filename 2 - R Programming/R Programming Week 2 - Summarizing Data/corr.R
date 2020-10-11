corr<-function(directory,threshold=0){
    files <- list.files(path = directory)
    openfiledf <- data.frame()
    corvect<-NULL
    for(i in seq_along(files)){
        openfiledf <- na.omit(read.csv(paste(sprintf("%03d",i),".csv",sep="")))
        if(nrow(openfiledf)>threshold){
            corvect<-c(corvect,cor(openfiledf$nitrate, openfiledf$sulfate))
        }
    }
    return(corvect)
}