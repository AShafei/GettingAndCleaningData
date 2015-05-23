# GettingAndCleaningData
The Getting And Cleaning Data Course Project

#This file contains the description of each step in the r file used to generate the tidy dataset
We started by reading  the test Data from all it's parts as the following:
 - Read the "./UCI HAR Dataset/test/y_test.txt" which contains the id of activties done by each volunteer
 - Read the "./UCI HAR Dataset/test/X_test.txt" using the read table and applying the column names in ("./UCI HAR Dataset/features.txt") to faciltae step No 4
 - Read "./UCI HAR Dataset/test/subject_test.txt" which contains the volunteer ids for each observation.

the same above 3 steps are done with the training data, using traing data files
 - Read the "./UCI HAR Dataset/train/y_train.txt") which contains the id of activties done by each volunteer
 - Read the "./UCI HAR Dataset/test/X_train.txt" using the read table and applying the column names in ("./UCI HAR Dataset/features.txt") to faciltae step No 4
 - Read ("./UCI HAR Dataset/test/subject_train.txt") which contains the volunteer ids for each observation.

Then the data are merged together for both training and test data.

*In Step 1 Merges the training and the test sets to create one data set for all the observations
*In Step 2 we utilize the grepl function to extract both mean and std columns form the full dataset
*In Step 3 we start reading the activities names from the file "./UCI HAR Dataset/activity_labels.txt"
which contains the text description of each one with it's relative Id

Then merged it with full dataset using the merge function and using on to join the data over the activity Id.
Then renamed the column names with the both activityId and activityLabel

*Step 4 was faciltae while reading test and train data intially to make it more easier since the read.table method can apply the colName.

*Step 5 we utilize the usage of group_by function followed by summarise_each to get the summary of the tidy data



  