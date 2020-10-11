## Define global variables:

## This function reads the outcome-of-care-measures.csv file and returns a character
## vector with the name of the hospital that has the num'th lowest 30-day mortality rate
## for the outcome specified in the state specified. It breaks ties by sorting all hospitals
## that perform equivalently on the mortality measure alphabetically by hospital and
## returning the first hospital in that alphabetic list
rankhospital <- function(state, outcome, num = "best") {
    outcomeOpt <- c("HEART ATTACK", "HEART FAILURE", "PNEUMONIA") ## Define valid outcome
    ## inputs
    
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Convert column names to all uppercase letters
    up <- toupper(colnames(data))
    names(data) <- up
    
    ## Convert outcome input to uppercase letters
    outcome <- toupper(outcome)
    
    validStates <- unique(data$STATE) ## Define valid state inputs
    
    ## Convert fields that may be ranked to numeric format
    data[,11] <- as.numeric(data[,11])
    data[,17] <- as.numeric(data[,17])
    data[,23] <- as.numeric(data[,23])

    ## If statements test for valid state & outcome inputs. If either is invalid
    ## the appropriate error message will be thrown.
    if(is.na(match(state,validStates))){
        stop("Invalid State")
    } else if(is.na(match(outcome,outcomeOpt))){
        stop("Invalid Outcome")
    }
    ## If inputs were valid, run this code to identify num'th best hospital in state for
    ## a particular outcome
    else{
        ## Replaces " " in outcome parameter with "."
        outcome <- gsub(" ",".",outcome)
        
        ## Appends outcome to the phrase that appears in every column header,
        ## "HOSPITAL.30.DAY.DEATH..MORTALITY..RATES.FROM."
        outcome <- paste("HOSPITAL.30.DAY.DEATH..MORTALITY..RATES.FROM.",outcome,sep = "")
        
        ## Filter data to the rows that pertain to your state.
        data <- data[data$STATE == state,]
        
        
        ## Sort mortality rates from lowest to highest
        index <- order(data[[outcome]],data$HOSPITAL.NAME,na.last = NA)
        data <- data[index,]
        
        #Set values for best & worst arguments
        if(num == "best"){
            num <- 1
        } else if(num == "worst"){
            num <- nrow(data)
        }
        
        #Check if num > number of rows in data set
        if(num > nrow(data)){
            return(NA)
        }
        
        #Get num ranked value
        data[num,"HOSPITAL.NAME"]
    }
}