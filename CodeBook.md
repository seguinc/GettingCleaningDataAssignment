====================================================================================================
Getting and Cleaning the Data - Final Assignment 
====================================================================================================
The source data for this work was extracted from here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The data was saved to a the working directory.
The data from the training and test sets of observations were combined. Each observation was then mapped to its corresponding subject and activity.

The data set resulting from the analysis (summaryData.txt) has been obtained by keeping only the measurements on the mean and standard deviation measurements, and taking the average for each subject and each activity. The variables of this data set are described below.

====================================================================================================
Variables
====================================================================================================


Variable Order		Variable Name		Variable		Value or explanation

1			subjectIndex		Subject Index		Values 1 to 30 that identify the subjects.

2			activityName		Name of the activity	Descriptive name of activity

3-81 			average of mean and standard deviation measurements on the following signals:
			tBodyAcc-XYZ
			tGravityAcc-XYZ
			tBodyAccJerk-XYZ
			tBodyGyro-XYZ
			tBodyGyroJerk-XYZ
			tBodyAccMag
			tGravityAccMag
			tBodyAccJerkMag
			tBodyGyroMag
			tBodyGyroJerkMag
			fBodyAcc-XYZ
			fBodyAccJerk-XYZ
			fBodyGyro-XYZ
			fBodyAccMag
			fBodyAccJerkMag
			fBodyGyroMag
			fBodyGyroJerkMag
