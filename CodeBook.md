-------------------------------------------------
# "Getting and Cleaning Data: Project: CodeBook"
-------------------------------------------------

## Introduction

This file describes the origin of the data, as well as their relationships. The relationship between the tables are the key that allows to merge an put together more than one table.

## Data Source

A full description of the data is available at 
*"http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones".

The data  for this project comes from 
*"http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"* 


## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

## Data Tables 

### General Aspects

In this part I show only the most important fields of each table, in the sense that these fields (*key fields*) are necessary to link one table with another. 

#### features Table

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

All the information desbribed above generates a (561 x 2) table, where each row represents one feature, and has 2 columns, the first for the id of the feature and the second for the name of the feature. 

#### activityLabels

Its a (6 x 2) table, where each row represents one activity. Each row has 2 columns, the first for the id of the activity and the second for the name of the activity. The content of the table is:

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING


### Train Data Tables

#### subjectTrain

Its a (7352 x 1) table, where each row represents one measurement of the train data collected for each subject who belong to the *train set*. The column represents the subject related with this measurement. The id subject in the *train set* data  are: 1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30. That is to say,  21 subjects which corresponds to the 70% of the group of 30 volunteers.


#### xTrain

Its a (7352 x 561) table, where each row represents the measurements of the train data collected for one subject, and each column represents each feature.   Notice that this table is related with *features* and has the samen number of rows that *subjectTest*, that it is to say, each row of *subjectTrain* can be combine with each row of *xTrain*

#### yTrain

Its a (7352 x 1) table, where each row represents the *train data* collected for the people on *train set*. The column represents the id of the activity. Notice that this table is related with *activityLabels*.  

### Train Data Tables: Relationships

*activityLabels* is related with *yTrain*: for each act_Id it could be one or more rows in *yTrain* and for each row in *yTrain* exist one and only one row in *activityLabels*. This realtionship is through the column "act_Id".

*Features* is related with *xTrain*: for each feature could be one or more rows in *xTrain* and vice versa. This relationship is through the 561 columns of *xTrain* where each one of the 561 columns is related with one row of the *features*, specifically with the value in the second column of each row.

*xTrain* is related with *yTrain*, each row of *xTrain* can be add to each row in *ytrain* and vice versa.

### Test Data tables

#### subjectTrain

Its a (7352 x 1) table, where each row represents the one measurements collected for each subject who belong to the *test set*. The column represents the subject related with this measurement. The id subject in the *test set* data  are:2, 4, 9, 10, 12, 13, 18, 20, 24. That is to say,  9 subjects which corresponds to the 30% of the group of 30 volunteers. 

#### xTest

Its a (7352 x 561) table, where each row represents *test data* collected and each columns represents the measurements of each feature.   Notice that this table is related with *features* and has the same number of rows of *subjectTest* that it is to say, each row of *subjectTest* can be combine with each row of *xTest*.

#### yTest

Its a (7352 x 1) table, where each row represents the *test data* collected for the people on *test set*. The column represents the id of the activity. Notice that this table is ralted with *activityLabels* 

### Test Data Tables: Relationships

*activityLabels* is related with *yTest*: for each act_Id it could be one or more rows in *yTest* and for each row in *yTest* exist one and only one row in *activityLabels*. This realtionship is through the column "act_Id".

*Features* is related with *xTest*: for each feature could be one or more rows in *xTest* and vice versa.

*xTest* is related with *yTest*, each row of *xTest* corresponds to each row in *yTest* and vice versa. This relationship is through the 561 columns of *xTest* where each one of the 561 columns is related with one row of the *features*, specifically with the value in the second column of each row.
