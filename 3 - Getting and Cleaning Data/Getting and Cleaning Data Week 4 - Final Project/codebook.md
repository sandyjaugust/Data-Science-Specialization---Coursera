# Overview

The run_analysis.R script will perform the following manipulations on data from the "Data source" link below:
Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Description of Data Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Steps
* If the data set is not already in the working directory, this script will download the data
* If the data has not already been unzipped, this script will unzip the data
* Load the data into R
* Merge the training and test sets in the datasource to create one data set
* Add labels, variable name headers & convert subject & activity into factor variables
* Extract only the mean and standard deviation variables for each measurement.
* Create a new tidy data set containing the average of each variable for each activity and each subject. The new data set is written into a file called "meandata.csv"

# Requirements
* Before running this script, please set a working directory.
* Install the reshape2 package prior to running this script

# Identififiers
* subject - numeric identifiers for each of the 30 subjects in the data set. Class = Factor
* activity - denotes the activities that each subject performed. The 6 activites are WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING, Class = Factor

# Measurements
* tbodyaccmeanx - Class: Numeric
* tbodyaccmeany - Class: Numeric
* tbodyaccmeanz - Class: Numeric
* tbodyaccstdx - Class: Numeric
* tbodyaccstdy - Class: Numeric
* tbodyaccstdz - Class: Numeric
* tgravityaccmeanx - Class: Numeric
* tgravityaccmeany - Class: Numeric
* tgravityaccmeanz - Class: Numeric
* tgravityaccstdx - Class: Numeric
* tgravityaccstdy - Class: Numeric
* tgravityaccstdz - Class: Numeric
* tbodyaccjerkmeanx - Class: Numeric
* tbodyaccjerkmeany - Class: Numeric
* tbodyaccjerkmeanz - Class: Numeric
* tbodyaccjerkstdx - Class: Numeric
* tbodyaccjerkstdy - Class: Numeric
* tbodyaccjerkstdz - Class: Numeric
* tbodygyromeanx - Class: Numeric
* tbodygyromeany - Class: Numeric
* tbodygyromeanz - Class: Numeric
* tbodygyrostdx - Class: Numeric
* tbodygyrostdy - Class: Numeric
* tbodygyrostdz - Class: Numeric
* tbodygyrojerkmeanx - Class: Numeric
* tbodygyrojerkmeany - Class: Numeric
* tbodygyrojerkmeanz - Class: Numeric
* tbodygyrojerkstdx - Class: Numeric
* tbodygyrojerkstdy - Class: Numeric
* tbodygyrojerkstdz - Class: Numeric
* tbodyaccmagmean - Class: Numeric
* tbodyaccmagstd - Class: Numeric
* tgravityaccmagmean - Class: Numeric
* tgravityaccmagstd - Class: Numeric
* tbodyaccjerkmagmean - Class: Numeric
* tbodyaccjerkmagstd - Class: Numeric
* tbodygyromagmean - Class: Numeric
* tbodygyromagstd - Class: Numeric
* tbodygyrojerkmagmean - Class: Numeric
* tbodygyrojerkmagstd - Class: Numeric
* fbodyaccmeanx - Class: Numeric
* fbodyaccmeany - Class: Numeric
* fbodyaccmeanz - Class: Numeric
* fbodyaccstdx - Class: Numeric
* fbodyaccstdy - Class: Numeric
* fbodyaccstdz - Class: Numeric
* fbodyaccmeanfreqx - Class: Numeric
* fbodyaccmeanfreqy - Class: Numeric
* fbodyaccmeanfreqz - Class: Numeric
* fbodyaccjerkmeanx - Class: Numeric
* fbodyaccjerkmeany - Class: Numeric
* fbodyaccjerkmeanz - Class: Numeric
* fbodyaccjerkstdx - Class: Numeric
* fbodyaccjerkstdy - Class: Numeric
* fbodyaccjerkstdz - Class: Numeric
* fbodyaccjerkmeanfreqx - Class: Numeric
* fbodyaccjerkmeanfreqy - Class: Numeric
* fbodyaccjerkmeanfreqz - Class: Numeric
* fbodygyromeanx - Class: Numeric
* fbodygyromeany - Class: Numeric
* fbodygyromeanz - Class: Numeric
* fbodygyrostdx - Class: Numeric
* fbodygyrostdy - Class: Numeric
* fbodygyrostdz - Class: Numeric
* fbodygyromeanfreqx - Class: Numeric
* fbodygyromeanfreqy - Class: Numeric
* fbodygyromeanfreqz - Class: Numeric
* fbodyaccmagmean - Class: Numeric
* fbodyaccmagstd - Class: Numeric
* fbodyaccmagmeanfreq - Class: Numeric
* fbodybodyaccjerkmagmean - Class: Numeric
* fbodybodyaccjerkmagstd - Class: Numeric
* fbodybodyaccjerkmagmeanfreq - Class: Numeric
* fbodybodygyromagmean - Class: Numeric
* fbodybodygyromagstd - Class: Numeric
* fbodybodygyromagmeanfreq - Class: Numeric
* fbodybodygyrojerkmagmean - Class: Numeric
* fbodybodygyrojerkmagstd - Class: Numeric
* fbodybodygyrojerkmagmeanfreq - Class: Numeric
* angletbodyaccmeangravity - Class: Numeric
* angletbodyaccjerkmeangravitymean - Class: Numeric
* angletbodygyromeangravitymean - Class: Numeric
* angletbodygyrojerkmeangravitymean - Class: Numeric
* anglexgravitymean - Class: Numeric
* angleygravitymean - Class: Numeric
* anglezgravitymean - Class: Numeric

