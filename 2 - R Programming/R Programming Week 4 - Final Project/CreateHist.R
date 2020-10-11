createHist <- function(){
    hist(as.numeric(OOCM[,11]), main = "Frequency of Death Rates after Heart Attack", xlab = "% of Heart Attack Patients who Die", ylab = "Number of Hospitals")
}