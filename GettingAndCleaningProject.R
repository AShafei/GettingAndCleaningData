setwd("D:\\Shafei\\GettingCleaningDataWD\\CourseProject")
library(dplyr)

##read the features names [variable Names]
featuresColNames<- read.table("./UCI HAR Dataset/features.txt")

###############################
#########read the test Data
testDataLabel<- read.table("./UCI HAR Dataset/test/y_test.txt")

## This step will facilitate Step 4 
testData<- read.table("./UCI HAR Dataset/test/X_test.txt",stringsAsFactors=TRUE,col.names=featuresColNames$V2,
,header=FALSE)
subjectTestData<- read.table("./UCI HAR Dataset/test/subject_test.txt")
subjectTestData<- rename(subjectTestData,volunteerId= V1)
##merge the test data with test data label and subject Test Data
finalTestData<- cbind(testDataLabel,subjectTestData,testData)
#remove un wanted variables
rm(testDataLabel,testData,subjectTestData)
#########End read the test Data
###############################

###############################
#########read the train data
trainDataLabel<- read.table("./UCI HAR Dataset/train/y_train.txt")


##This step will facilitate Step 4 
trainData<- read.table("./UCI HAR Dataset/train/X_train.txt",stringsAsFactors=TRUE,col.names=featuresColNames$V2,
,header=FALSE)
subjectTrainData<- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjectTrainData<- rename(subjectTrainData,volunteerId= V1)
##merge the train data with train data label and subject train Data
finalTrainData<- cbind(trainDataLabel,subjectTrainData,trainData)
#remove un wanted variables
rm(trainDataLabel,subjectTrainData,trainData)
#########end read the train data
###############################


## Step 1 Merges the training and the test sets to create one data set
completedTrainTestData<- rbind(finalTrainData,finalTestData)
rm(finalTrainData,finalTestData)

## Step 2 Extracts only the measurements on the mean and standard deviation for each measurement. 
completedTrainTestData[ , grepl( "mean" , names( completedTrainTestData ) ) ]
completedTrainTestData[ , grepl( "std" , names( completedTrainTestData ) ) ]

## Step 3 Uses descriptive activity names to name the activities in the data set
##read the activity labesl
activityLables<- read.table("./UCI HAR Dataset/activity_labels.txt")
completedTrainTestData = merge(completedTrainTestData,activityLables,by.x="V1",by.y="V1")
completedTrainTestData<- rename(completedTrainTestData,activityId= V1)
completedTrainTestData<- rename(completedTrainTestData,activityLabel= V2)

## Step 4 Appropriately labels the data set with descriptive variable names.
## Was Applied while reading testData and trinData with read.table function Applied the col.Names

## Step 5 From the data set in step 4, creates a second, 
##independent tidy data set with the average of each variable for each activity and each subject
tidySummarizedData<-group_by(completedTrainTestData, volunteerId, activityLabel) %>% summarise_each(funs(mean))
write.table(tidySummarizedData, file = "tidySummarizedData.txt", sep = ",", row.name=FALSE)
