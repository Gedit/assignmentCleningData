# Steps performed by "run_analysis.R"

 1. Read in and merge the data sets:
* Read in the training files x_train.txt, y_train.txt and subject_train.txt from the folder "/train". Resulting R objects are called "trainDat", "trainLab" and "trainSub". 
* Read in the test files x_test.txt, y_test.txt and subject_test.txt from the folder "/test". Resulting R objects are called "testDat", "testLab" and "testSub". 
* join "training" and "test" data "*Dat", "*Lab" and "*Sub" objects via rbind. Resulting objects are called "joinDat", "joinLab", and "joinSub".

2. Extract columns containg means and standard deviations from the data set.
* The file "features.txt" contained the column identifiers for "JoinDat". It is filtered for "mean" and "std" entries.
* Columns containing the mean and standard deviation in "JoinDat" are extracted from the data set. This reduces the number of column in "joinDat" from 561 to 66.

3. Update the activity numbers with discriptive labels
* The file "activity_labels.txt" containes the label information. It is read into R and the label numbers in "joinLab" are renamed accordingly.

4. Join the cleaned data components
* "JoinSub" (containing the subject numbers), "joinLab" (containing the activity labels) and "joinData" (containing the actual data) are merged in the final data frame "cleanDat". 
* The resulting data was written to the file "merged_data.txt".

5. Calculate the means for each activity and subject
* The function "aggregate" calculates the means for each column ("for"-loop), grouped by activity and subject. 
* The resulting data frame "datMeans" contains the means for each column for subject and activity.
* The resulting data was written to the file "data_means.txt".



# Instructions for running "run_analysis.R".

1. unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. change to the unzipped folder "getdata_projectfiles_UCI HAR Dataset" and open Rstudio. 
3. change the working directory to your path in R:
```
setwd(" ...insert your path here... /getdata_projectfiles_UCI HAR Dataset/")
```
4. use the command to run merge the data:
```
source("run_analysis.R")
```
5. After the analysis is done there should be two new files in the working directory called "merged_data.txt" and "data_means.txt" which contain the cleaned data. 
* "merged_data.txt" contains all the data for mean measurements and standard deviations (10299 rows and 68 columns)
* "data_means.txt" contains the means for each subject and activity (180 rows and 68 columns)

6. The data can be read into R by using the following command:
```
mergedData <- read.table("merged_data.txt")
meansData <- read.table("data_means.txt")
```

