
#### 1. Merges the training and the test sets to create one data set.
#training data:
trainDat <- read.table("./UCI HAR Dataset/train/X_train.txt") #training data
#dim(trainData) # 7352*561
trainLab <- read.table("./UCI HAR Dataset/train/y_train.txt") #training labels
#table(trainLabel) # labels 1-6
trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt") #training subject numbers
#table(trainSubject) # subjects 1-30

#test data:
testDat <- read.table("./UCI HAR Dataset/test/X_test.txt") #test data
#dim(testData) # 2947*561
testLab <- read.table("./UCI HAR Dataset/test/y_test.txt") #test labels
#table(testLabel) #labels 1-6
testSub <- read.table("./UCI HAR Dataset//test/subject_test.txt") #test subject numbers
#table(trainSubject) # subjects 1-30

#merge data, lebels and subjects:
joinDat <- rbind(trainDat, testDat)
#dim(joinData) # 10299*561
joinLab <- rbind(trainLab, testLab)
#dim(joinLabel) # 10299*1
joinSub <- rbind(trainSub, testSub)
#dim(joinSubject) # 10299*1



### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# features:
features <- read.table("./UCI HAR Dataset/features.txt") # read in features -> column names for data
#dim(features)  # 561*2
meanInd <- grep("mean\\(|std\\(", features[, 2]) #match features named "mean" or "std" 
#length(meanStdIndices) # 66 features selected
joinDat <- joinDat[, meanInd] #reduce data to columns with mean or std values
#dim(joinData) # 10299*66
#add and cleanup colum names:
names(joinDat) <- gsub("mean", "Mean", features[meanInd, 2]) # uppercase M
names(joinDat) <- gsub("std", "Std", names(joinDat)) # uppercase S
names(joinDat) <- gsub("\\(\\)", "", names(joinDat)) # remove "()"
names(joinDat) <- gsub("-", "", names(joinDat)) # remove "-"



### 3. Uses descriptive activity names to name the activities in the data set
activity <- read.table("./UCI HAR Dataset/activity_labels.txt") #read in propper labels
activity[, 2] <- tolower(activity[, 2]) #lowercase labels
joinLab[, 1] <- activity[joinLab[, 1], 2] #update labels with discriptive activity
names(joinLab) <- "activity" #better column name



### 4. Appropriately labels the data set with descriptive variable names.
names(joinSub) <- "subject" #better column name
cleanedDat <- cbind(joinSub, joinLab, joinDat) #join clean data frame
#dim(cleanedData) # 10299*68
write.table(cleanedDat, "merged_data.txt", row.names = FALSE) # write the cleaned dataset to file



### 5. From the data set in step 4, creates a second, independent tidy data 
### set with the average of each variable for each activity and each subject.
datMeans <- aggregate(cleanedDat[,3] ~ activity*subject, data = cleanedDat, mean) #calculate for first column
for (i in 4:ncol(cleanedDat)){ #repeat for the remaining columns
    datMeans <- cbind(datMeans, aggregate(cleanedDat[,i] ~ activity*subject, data = cleanedDat, mean)[,3]) 
}
datMeans[,1:2] <- datMeans[,2:1] #swap columns 1 and 2 to be consistent to results of 4.
names(datMeans) <- names(cleanedDat) #rename to proper column names
#head(result)
write.table(datMeans, "data_means.txt", row.names = FALSE) # write the dataset to file



