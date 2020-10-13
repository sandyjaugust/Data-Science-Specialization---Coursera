## GettingAndCleaningDataProject
This Repo contains the solution for Coursera's Getting and Cleaning Data Course Project. The purpose of the project is to download accelerometer data from wearable fitness devices & create a tidy data file containing the means of each variable for each combination of subject & activity

Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of Data Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#### The run_analysis.R script will do the following:

1. If the data set is not already in the working directory, this script will download the data
2. If the data has not already been unzipped, this script will unzip the data
3. Load the data into R
4. Merge the training and test sets in the datasource to create one data set
5. Add labels, variable name headers & convert subject & activity into factor variables
6. Extract only the mean and standard deviation variables for each measurement.
7. Create a new tidy data set containing the average of each variable for each activity and each subject. The new data set is written into a file called "meandata.csv"
8. The codebook.md file details how the run_analysis.R file works
