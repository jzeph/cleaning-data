#cleaning-data
##Code Book
As described in the README.md file in this repository, the data for this project was provided by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto through their 'Human Activity Recognition Using Smartphones Dataset 1.0' project.

As explained in readme file for the source data, experiments were performed on a group of 30 people. Each person performed six activities while wearing a Samsung smartphone on the waist. The six activities for which data was collected were WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING.

The main data source in x_test.txt and x_train.txt contained feature information on the activity measurements for the 30 people for each of the 6 activities. The course project instructed us to only look at features that contained the mean or standard deviation for each measurement. Using grep to isolate 'mean' or 'std' in the feature column resulted in the following features. 

From the feature selection code book in the original data source, these signals were used to estimate variables of the feature vector for each pattern:  <br>

('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.)<br>

tBodyAcc-XYZ<br>
tGravityAcc-XYZ<br>
tBodyAccJerk-XYZ<br>
tBodyGyro-XYZ<br>
tBodyGyroJerk-XYZ<br>
tBodyAccMag<br>
tGravityAccMag<br>
tBodyAccJerkMag<br>
tBodyGyroMag<br>
tBodyGyroJerkMag<br>
fBodyAcc-XYZ<br>
fBodyAccJerk-XYZ<br>
fBodyGyro-XYZ<br>
fBodyAccMag<br>
fBodyAccJerkMag<br>
fBodyGyroMag<br>
fBodyGyroJerkMag<br>

The mean and the standard deviation for each of these features was extracted by the R script into the main data set. Also included were: 

gravityMean<br>
tBodyAccMean<br>
tBodyAccJerkMean<br>
tBodyGyroMean<br>
tBodyGyroJerkMean<br>

No further cleaning or normalization of the feature names was performed by the R script. 

###Works Cited
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
