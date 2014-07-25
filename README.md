---------------------------------------
# "Getting and Cleaning Data: Project"
----------------------------------------

## run_analysis.R

### Introduction

The **run_analysis.R** script does the following

1. Merges the *training* and the *test* sets to create one data set.
2. Extracts only the measurements on the *mean* and *standard deviation* for each measurement.
3. Uses *descriptive activity names* to name the activities in the data set.
4. Appropriately labels the data set with *descriptive variables names*.
5. Creates a second independent tidy data set with the average of each activity and each subject

### Data set information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

### Process Description

1.  Merges the *training* and the *test* sets to create one data set.

In this section **read** each one of the files related with the training and test data. After that assign names to the columns. Then create two files: **traingData** and **test data**, and finally put together in a new file **fullData** which contains the id of the subject, the id of the activities and the next 561 columns corresponds to the features. In addition this file contains 10299 rows, which corresponds to all data set, of all 30 subjects (training + test).

2. Extracts only the measurements on the *mean* and *standard deviation* for each measurement.

First at all, I identified the name of the columns of **fullData**, and then I use the function **grep** to identify only the columns associated  with the words **mean** or **std**, and put this information in a new file **meanStd**.

After that update the **fullData**  only with the columns of my interest: *id of the subject*, *id of the activity* and the *features in meanStd*.

3. Uses *descriptive activity names* to name the activities in the data set.

Add the column name of the activities to the file **fullData**, to do this *merge* the files **fullData**, with the file **activityLabels**, the last file contains the id of the activity (the column used for merging) and the name of the activity. 
 

4. Appropriately labels the data set with *descriptive variables names*.

I put in **colNames** the updated names of the columns of **fullData**. Then, I updating this names with descriptivie variable names. Finally I *update* the names of the column of **fullData** with this descriptive variable names.

5. Creates a second independent tidy data set with the average of each activity and each subject.

In this part of the process I used the **melt** and the **dcast** function to summarize the data, and create a nex fil named **tidyData**, in which for each subject and  activity, are shown the mean of each activity.

Finally write **tidyData** in a text file.
