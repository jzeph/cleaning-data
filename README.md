# cleaning-data
Course Project for Coursera's Getting and Cleaning Data Class

This is the repository for my course project for Coursera's Getting and Cleaning Data Class, part of the Data Science specialization.

##Data Source
We are using data supplied from the Center for Machine Learning and Intelligence Systems hosted at the University of California - Irvine. 
The [actual data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is from a study called "Human Activity Recognition Using Smartphones". This is a database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. Original data owners are: 

>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.<br>
>Smartlab - Non Linear Complex Systems Laboratory<br>
>DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy.<br>
>activityrecognition '@' smartlab.ws<br>
>www.smartlab.ws <br>

##Raw Data
Our class version of the data can be downloaded from <br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

We are interested in the following data files:<br>
*x_test.txt and x_train.txt - raw data for the test and training data sets<br>
*y_test.txt and y_train.txt - labels for the test and training data sets<br>
*subject_test.txt and subject_train.txt - numerical identifiers (1 - 30) for the thirty subjects who took the tests<br>
*features.txt - variables measured by the phone accelerometer and gyroscope<br>

##R Script
The [run_analysis.R script](https://github.com/jzeph/cleaning-data/blob/master/run_analysis.R) assumes that you have downloaded the class version of the data and unzipped it into your R working directory. You will see the folder "UCI HAR Dataset" appear in your R working directory. 

The R script reads in the test and train data files and labels. It then merges the test and train data sets into a single data set. 

We only want to look at features which represent mean or standard deviation measurements, so grep is used to extract any columns of data with 'mean' or 'std' in the feature label. Then the feature names are added to the respective column in the extracted data set. 

Next the activity names are added to the data set, e.g. '1' in the data set represents 'WALKING' activity. Finally, the subject column is bound into the data set. The resulting table is comprised of one Subject and one Activity column, followed by 79 columns of Features.

To tidy the final data set, dplyr is used. The table is grouped by Subject and Activity and then summarise_each(funs(mean) is applied to the 79 Feature columns to determine the mean of each feature for a particular Subject/Activity combination. The output data is a text file named "SamsungData_tidy.txt" which is exported into the script user's working directory.

##Code Book
The Code Book contains a description of the data source and an explanation of the features included in the data set. 









