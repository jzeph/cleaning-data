#This script assumes you have downloaded the data from 
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#and have unzipped the data into your working directory in R.

#Read in the test data set and labels.
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")

#Read in the training data set and labels.
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")

#Merge the test and training data to create one dataset.
ttData <- rbind(testData, trainData)



##ADD THE FEATURES INFO TO THE DATA SET AND EXTRACT REQUIRED COLUMNS
#Read in the features table. Features is a table with V1 representing the 
#column index and V2 representing the feature label.
features <- read.table("UCI HAR Dataset/features.txt")

#Use grep to extract only the measurements on the mean and 
#standard deviation for each measurement. 
cols <- grep("mean|std", features$V2)
colNames <- grep("mean|std", features$V2, value=TRUE)

#Subset ttData to extract the mean and std columns based on the cols list. 
ttData <- ttData[,cols]

#Assign each column in ttData a descriptive name using its respective name 
#from the features list.
colnames(ttData) <- colNames



##ADD AND FORMAT THE ACTIVITY NAMES TO THE DATA SET
#Combine the test and train label files.
ttLabels <- rbind(testLabels, trainLabels)

#Add the activity names to the ttLabels file.
ttLabels[ttLabels == 1] <- c("WALKING")
ttLabels[ttLabels == 2] <- c("WALKING_UPSTAIRS")
ttLabels[ttLabels == 3] <- c("WALKING_DOWNSTAIRS")
ttLabels[ttLabels == 4] <- c("SITTING")
ttLabels[ttLabels == 5] <- c("STANDING")
ttLabels[ttLabels == 6] <- c("LAYING")

#Add the ttLabels file to the dataset and rename the first col to Activity.
ttData <- cbind(ttLabels, ttData)
colnames(ttData)[1] <- "Activity"


##ADD THE SUBJECT COLUMN TO THE DATA SET
ttSubject <- rbind(testSubject, trainSubject)
ttData <- cbind(ttSubject, ttData)
colnames(ttData)[1] <- "Subject"



##CREATE A TIDY DATA SET
#create a second, independent tidy data set with the average
#of each variable for each activity and each subject.

##We will use dplyr to reformat data.
library(dplyr)
tidy <- tbl_df(ttData)
#Group the dataset by Subject and Activity
#Then apply the mean to each column of data for a specific Subject/Activity grouping
output <- tidy %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))
View(output)

#output data for submission to assignment
write.table(output, "SamsungData_tidy.txt", row.names=FALSE)

