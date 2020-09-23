library(dplyr)

setwd("C:/Users/hp/Desktop/captain/R/datasciencecoursera/UCI HAR Dataset")
features <- read.table('features.txt')
colnames(features) <- c('n','Function')
activities <- read.table('activity_labels.txt')
colnames(activities) <- c('id','Activity')
test_subjects <- read.table('test/subject_test.txt')
colnames(test_subjects) <- c('subject')
test_x = read.table('test/X_test.txt')
colnames(test_x) <- features$Function
test_y <- read.table('test/y_test.txt')
colnames(test_y) <- c('id')
train_subjects <- read.table('train/subject_train.txt')
colnames(train_subjects) <- c('subject')
train_x <- read.table('train/X_train.txt')
colnames(train_x) <- features$Function
train_y <- read.table('train/y_train.txt')
colnames(train_y) <- c('id')

x_data <- rbind(train_x,test_x)
y_data <- rbind(train_y,test_y)
subject_data <- rbind(train_subjects,test_subjects)
NewDataMerged <- cbind(subject_data,y_data,x_data)

Tidydata <- select(NewDataMerged,subject,id,contains('mean'),contains('std'))
Tidydata$id <- activities[Tidydata$id,2]
names(Tidydata)[2] = 'Activity'


names(Tidydata) <- gsub("Acc", "Accelerometer", names(Tidydata))
names(Tidydata) <- gsub("Gyro", "Gyroscope", names(Tidydata))
names(Tidydata) <- gsub("BodyBody", "Body", names(Tidydata))
names(Tidydata) <- gsub("Mag", "Magnitude", names(Tidydata))
names(Tidydata) <- gsub("^t", "Time", names(Tidydata))
names(Tidydata) <- gsub("^f", "Frequency", names(Tidydata))
names(Tidydata) <- gsub("tBody", "TimeBody", names(Tidydata))
names(Tidydata) <- gsub("-mean()", "Mean", names(Tidydata), ignore.case = TRUE)
names(Tidydata) <- gsub("-std()", "STD", names(Tidydata), ignore.case = TRUE)
names(Tidydata) <- gsub("-freq()", "Frequency", names(Tidydata), ignore.case = TRUE)
names(Tidydata) <- gsub("angle", "Angle", names(Tidydata))
names(Tidydata) <- gsub("gravity", "Gravity", names(Tidydata))

Tidydata <- group_by(Tidydata,subject,Activity)
IndependentData <- summarise_all(Tidydata,list(mean))