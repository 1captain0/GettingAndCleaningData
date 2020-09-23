---
title: "CodeBook"
author: "Kevin Benny"
date: "23 September 2020"
output:
  pdf_document: default
  html_document: default
---



The *'run_analysis.R'* script performs the data preparation and then followed by the 5 steps required as described in the course project’s definition.

## Download the dataset
Dataset downloaded and extracted under the folder called UCI HAR Dataset

## Assign each data to variables
1. features <- features.txt : 561 rows, 2 columns
  + the features are from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
2. activities <- activity_labels.txt : 6 rows, 2 columns 
  + list of activities performed and their corresponding id's
3. subject_test <- test/subject_test.txt : 2947 rows, 1 column 
  + contains test data of 9/30 volunteer test subjects being observed
4. test_x <- test/X_test.txt : 2947 rows, 561 columns 
  + contains recorded features test data
5. test_y <- test/y_test.txt : 2947 rows, 1 columns 
  + contains test data of activities’code labels
6. subject_train <- test/subject_train.txt : 7352 rows, 1 column 
  + contains train data of 21/30 volunteer subjects being observed
7. train_x <- test/X_train.txt : 7352 rows, 561 columns 
  + contains recorded features train data
8. train_y <- test/y_train.txt : 7352 rows, 1 columns 
  + contains train data of activities’code labels

## Merges the training and the test sets to create one data set
1. x_data (10299 rows, 561 columns) is created by merging train_x and test_x using rbind() function
2. y_data (10299 rows, 1 column) is created by merging train_y and test_y using rbind() function
3. subject_data (10299 rows, 1 column) is created by merging subject_train and subject_test using 4. rbind() function
5. NewDataMerged (10299 rows, 563 column) is created by merging subject_data,y_data  and x_data using cbind() function

**Extracts only the measurements on the mean and standard deviation for each measurement to a dataframe Tidydata**

**Uses descriptive activity names to name the activities in the data set**


## Appropriately labels the data set with descriptive variable names
code column in TidyData renamed into activities
All Acc replaced by Accelerometer
All Gyro replaced by Gyroscope
All replaced by Body
All Mag replaced by Magnitude
All start with character f replaced by Frequency
All start with character t replaced by Time

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject -> IndependentData

Export IndependentData into IndependentData.txt file.
