library(dplyr)

## This function reads the outcome-of-care-measures.csv file and returns a character
## vector with the name of the hospital that has the lowest 30-day mortality for the
## outcome specified in the state specified. It breaks ties by sorting all hospitals
## that perform equivalently on a mortality measure alphabetically by hospital and
## returns the first hospital in that alphabetic list

best <- function(state, outcome) {
    outcomeOpt <- c("HEART ATTACK", "HEART FAILURE", "PNEUMONIA") ## Define valid outcome
    ## inputs
    
    ##Open file. Store in the "data" dataframe
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    ## Convert column names to all uppercase letters
    up <- toupper(colnames(data))
    names(data) <- up
    
    validStates <- unique(data$STATE) ## Define valid state inputs
    
    ## Convert outcome input to uppercase letters
    outcome <- toupper(outcome)
    
    ## Convert fields that will be ranked to numeric format
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
    
    ## If inputs were valid, run this code to identify best hospital in state for a
    ## particular outcome
    else{
        ## Replaces " " in outcome parameter with "."
        outcome <- gsub(" ",".",outcome)
        
        ## Appends outcome to the phrase that appears in every column header,
        ## "HOSPITAL.30.DAY.DEATH..MORTALITY..RATES.FROM."
        outcome <- paste("HOSPITAL.30.DAY.DEATH..MORTALITY..RATES.FROM.",outcome,sep = "")
        
        ## Filter data to the rows that pertain to your state.
        data <- data[data$STATE == state,]
        
        
        ## Sort mortality rates from lowest to highest
        data <- arrange(data,data[[outcome]])
        
        ## The rest of the code is designed to test for a tie. If there is a tie for
        ## best hospital in a state, the remaining lines of code will break that tie
        ## by identifying the hospital the appears first alphabetically as best
        
        ## Store mortality rate for top-ranked hospital in tieBreak
        tieBreak <- data[1,outcome]
        
        ## Count all values equal to tieBreak
        tieCheck <- sum(data[outcome] == tieBreak, na.rm = TRUE)
        
        ## If count of values that are equal to tieBreak is greater than 1
        ## break tie by returning the hospital that appears first alphabetically
        ## in the list of hospitals with the top-ranked mortality rate
        if(tieCheck > 1){
            tieList <- data[!is.na(data[[outcome]])==TRUE,]
            tieList <- tieList[tieList[[outcome]] == tieBreak,]
            tieList <- arrange(tieList,HOSPITAL.NAME)
            tieList[1,"HOSPITAL.NAME"]
        ## If count of values that are equal to tieBreak is less than 1, return
        ## first hospital in list
        } else{
            data[1,"HOSPITAL.NAME"]
        }
    }
}

## Code block to find ties for testing
# dup <- vector()
# for(i in seq_along(state.abb)){
#     state = state.abb[i]
#     outcome = "heart failure"
#     data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
# 
#     up <- toupper(colnames(data))
#     names(data) <- up
# 
#     outcome <- toupper(outcome)
#     
#     data[,11] <- as.numeric(data[,11])
#     data[,17] <- as.numeric(data[,17])
#     data[,23] <- as.numeric(data[,23])
#     
#     outcome <- gsub(" ",".",outcome)
#     
#     outcome <- paste("HOSPITAL.30.DAY.DEATH..MORTALITY..RATES.FROM.",outcome,sep = "")
#     
#     data <- data[data$STATE == state,]
#     
#     data <- arrange(data,data[[outcome]])
#     
#     if(data[1,outcome] == data[2,outcome]){
#         dup <- c(dup,1)
#     } else{
#         dup <- c(dup,0)
#     }
# }
