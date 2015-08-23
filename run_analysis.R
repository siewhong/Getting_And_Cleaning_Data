# Coursera Getting and Cleaning Data Course Project
# Siew Hong
# 2015-08-23

# runAnalysis.r File Description:

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

######################################################################################################################

# step-1: merges the training and the test sets to form a new dataset
# getwd()
# setwd("C:/Users/LAMSE/Documents/Module3/Assignment")
trainData <- read.table("./dataset/train/X_train.txt")
trainLabel <- read.table("./dataset/train/y_train.txt")
trainSubject <- read.table("./dataset/train/subject_train.txt")

testData <- read.table("./dataset/test/X_test.txt")
testLabel <- read.table("./dataset/test/y_test.txt")
testSubject <- read.table("./dataset/test/subject_test.txt")

combineData <- rbind(trainData, testData)
combineLabel <- rbind(trainLabel, testLabel)
combineSubject <- rbind(trainSubject, testSubject)

#step-2: Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./dataset/features.txt")
featureSelected <- features[grep("mean|std",features$V2),]
combineData_feature <- combineData[,featureSelected$V1]
featureSelected <- gsub("\\(\\)","",featureSelected$V2)
featureSelected <- gsub("-","",featureSelected)
featureSelected <- gsub("mean","Mean",featureSelected)
featureSelected <- gsub("std","Std",featureSelected)

# Step-3: Uses descriptive activity names to name the activities in the data set

activity <-read.table("./dataset/activity_labels.txt")
activityLabel <- activity[combineLabel[,1],2]   
combineLabel[,1] <- activityLabel

# Step-4: Appropriately labels the data set with descriptive variable names. 

names(combineData_feature) <- featureSelected
names(combineLabel) <- "activity"
names(combineSubject) <- "Subject"

cleanData <- cbind(combineSubject, combineLabel, combineData_feature)
write.table(cleanData,"cleanDataset.txt", row.name=FALSE)

# Step-5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#-------------------data.table------------------------
library(data.table)
cleanData<-data.table(cleanData)
tidyDataAverage<-cleanData[, lapply(.SD, mean), by="Subject,activity"]   #.SD = sub data
write.table(tidyDataAverage,"tidydata.txt", row.name=FALSE)


#--------------------dplyr ---------------------------
#library(dplyr)
#byGroupMean<- cleanData %>%
#          group_by(Subject,activity) %>%
#          summarise_each(funs(mean))
#View(byFeatureMean)
#-----------------------------------------------------
