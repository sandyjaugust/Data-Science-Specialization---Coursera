library(reshape2)

## If data has not already been downloaded, download data for analysis
fileName = "accelerometerData.zip"
if(!file.exists(fileName)){
    fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,fileName, method = "curl")
}

## If data has not already been unzipped, unzip data set
if(!file.exists("UCI HAR Dataset")){
    unzip(fileName)
}

## load & bind datasets into a single data set
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("UCI HAR Dataset/test/subject_test.txt")
x <- cbind(subjecttest,ytest,xtest)

xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("UCI HAR Dataset/train/subject_train.txt")
y <- cbind(subjecttrain,ytrain,xtrain)

data <- rbind(x,y)

## Load activity labels & features
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activitylabels$V2 <- as.character(activitylabels$V2)
features <- read.table("UCI HAR Dataset/features.txt")
features$V2 <- as.character(features$V2)

## Convert subject & activities into factors
data[,1] <- as.factor(data[,1])
data[,2] <- factor(data[,2], levels = activitylabels[,1], labels = activitylabels[,2])

## Name columns in data set
featurenm <- features[,2]
featurenm <- gsub("[-(),]","",featurenm)
featurenm <- tolower(featurenm)

colnames(data) <- c("subject","activity",featurenm)

##subset data to column headers containing mean or std
cols <- grep("(mean|std)", names(data))
data <- data[,c(1,2,cols)]

##melt data by subject, activity; then calculate mean of each measurement
meltdata <- melt(data, id = c("subject","activity"))
meandata <- dcast(meltdata, subject + activity ~ variable, mean)

##create new tidy dataset
write.csv(meandata, "meandata.csv", row.names=FALSE)
write.table(meandata, "meandata.txt", row.names = FALSE, quote = FALSE)