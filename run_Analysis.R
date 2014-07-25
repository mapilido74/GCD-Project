# ****************************************
# ** Getting and Cleaning Data :Project **
# ****************************************

## Goal: Is to prepare "TIDY DATA that can be used for later analysis

## 1.- Merges the "trainig" and the "test" sets to create ONE data set

setwd("F:/Getting and Cleaning Data/Project")

### Read the data

features     = read.table('./features.txt',header=FALSE)
activityLabels = read.table('./activity_labels.txt',header=FALSE) 
subjectTrain = read.table('./train/subject_train.txt',header=FALSE) 
xTrain       = read.table('./train/x_train.txt',header=FALSE) 
yTrain       = read.table('./train/y_train.txt',header=FALSE) 

### Assign names to the columns 

colnames(activityLabels)  = c("act_Id", "act_Type")
colnames(subjectTrain)  = "sub_Id"
colnames(xTrain)        = features[,2] 
colnames(yTrain)        = "act_Id"

### Combine the tables subjectTrain, yTrain and xTrain and have all the training data in one table

trainingData<-cbind(yTrain, subjectTrain, xTrain)

dim(trainingData) ## dim: 7352 563

### Read test data

subjectTest = read.table('./test/subject_test.txt',header=FALSE)
xTest       = read.table('./test/x_test.txt',header=FALSE)
yTest       = read.table('./test/y_test.txt',header=FALSE)

### Assign column names to the test data imported above

colnames(subjectTest) = "sub_Id"
colnames(xTest)       = features[,2]
colnames(yTest)       = "act_Id"

###  Combine the test data to link subject, features and activities

testData = cbind(yTest,subjectTest,xTest)

dim(testData) ## dim: 2947 563

### Create ONE data set, to merge training and test data: fullData

fullData<-rbind(trainingData, testData) 

dim(fullData)   ## dim: 10299 x 563


## 2.- Extracts ONLY the measurementes on th mean and standard deviation

### I need to identify the colNames which contain the pattern "mean" & "std"

colNames  = colnames(fullData) 

length(colNames)  ## 563

### I use grep for match in the colnames: "mean" and "std".
### meanStd is a vector:  66 col matched

meanStd <-grep("mean\\(|std\\(", names(fullData), value = TRUE)

### Update the fullData only with the columns of my interest

fullData<-fullData[, c("act_Id", "sub_Id", meanStd)]  

dim(fullData)  ## dim: 10299 68

## 3.- Uses descriptive activity names to name the activities 

### Add the column act_Type (from the ActivityLabels table) to the table fullData

fullData = merge(fullData,activityLabels,by='act_Id',all.x=TRUE)

dim(fullData)  ## dim: 10299 69

### 4.- Appropriately labels the data set with descriptive variable names

colNames=colnames(fullData)  

for ( i in 1:length(colNames)) {
    
    colNames[i] <- gsub("\\-|\\(|\\)", "", colNames[i]) 
    colNames[i] <- gsub("^t", "timedomain",colNames[i]) 
    colNames[i] <- gsub("^f", "freqdomain", colNames[i]) 
    colNames[i] <- gsub("Gyro", "gyroscope", colNames[i]) 
    colNames[i] <- gsub("Acc", "accelerometer", colNames[i]) 
    colNames[i] <- gsub("Mag", "magnitude", colNames[i]) 
    colNames[i]<- gsub("BodyBody", "body", colNames[i]) 
    colNames[i] <- gsub("(.+)(std|mean)(X$|Y$|Z$)", "\\1\\3\\2", colNames[i]) 
}

# Updating the colNames vector to include the new names of the columns 

colnames(fullData) <-colNames ##  Update the names of the columns

## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

### Summarizing the fullData table to include just the mean of each variable for each activity and each subject

tidyData=melt(fullData, id=c('act_Id', 'sub_Id', 'act_Type'))

tidyData=dcast(tidyData, act_Id+sub_Id+act_Type~variable, mean)

dim(tidyData) ## 180 69

### Export the tidyData set 

write.table(tidyData, "tidydata.txt", row.names = FALSE, sep = "\t")

