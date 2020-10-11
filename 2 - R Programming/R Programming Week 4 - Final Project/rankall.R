rankall <- function(outcome, num = "best") {
    outcomeOpt <- c("HEART ATTACK", "HEART FAILURE", "PNEUMONIA") ## Define valid outcome
    ## inputs
    
    ##Open file. Store in the "data" dataframe
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Convert column names to all uppercase letters
    up <- toupper(colnames(data))
    names(data) <- up
    
    ## Convert outcome input to uppercase letters
    outcome <- toupper(outcome)
    
    ## If statement tests for valid outcome input. If it is invalid the appropriate
    ## error message will be thrown.
    if(is.na(match(outcome,outcomeOpt))){
        stop("Invalid Outcome")
    }
    else{
        ## Replaces " " in outcome parameter with "."
        outcome <- gsub(" ",".",outcome)
        
        ## Appends outcome to the phrase that appears in every column header,
        ## "HOSPITAL.30.DAY.DEATH..MORTALITY..RATES.FROM."
        outcome <- paste("HOSPITAL.30.DAY.DEATH..MORTALITY..RATES.FROM.",outcome,sep = "")
        
        #Remove columns that will not be needed in analysis
        keepcols <- c("STATE","HOSPITAL.NAME",outcome)
        data <- data[,keepcols]
        
        ## Convert fields that will be ranked to numeric format
        data[,3] <- as.numeric(data[,3])
        
        ## Remove NA values for chosen outcome
        data <- data[is.na(data[[outcome]])==FALSE,]
        
        ## split data into list of data frames by state.
        data <- split(data,data$STATE)
        
        ## convert list of data frames into list of num'th hospitals, labeled by state
        data <- lapply(data, function(x, num){
            ## Sort data into ranked lists by mortality rate by state for given outcome
            index <- order(x[[outcome]],x$HOSPITAL.NAME, na.last = TRUE)
            x <- x[index,]
            
            if(num == "best"){
                return(x$HOSPITAL.NAME[1])
            }
            else if(num == "worst"){
                return(x$HOSPITAL.NAME[nrow(x)])
            }
            else{
                return(x$HOSPITAL.NAME[num])
            }
        },num)
        
        # # Return a data frame with the hospital names and the
        # ## (abbreviated) state name
        return(data.frame(hospital = unlist(data),state=names(data)))
    }
}