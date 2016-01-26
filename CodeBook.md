Getting and Cleaning Data Course Project CodeBook
=========================================
This code book describes the data source and variables in the produced data sets of the R script "run_analysis.R"

# Data source

The data was retrieved from this website:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

And the data can be directly downloaded via this link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


# Variables

1. Cleaned data: "merged_data.txt"

* subject: Number of the test subject (1-30)

* activity: One of the following: (1) walking, (2) walking_upstairs, (3) walking_downstairs, (4) sitting, (5) standing, (6) laying. The number in brackets corresponds to the activity number in the original data set.

* The following 66 columns contain mean and standard deviation data from the different measurements. Further information is provided in "README.txt" in the downloaded archive.

2. Calculated means of cleaned data: "data_means.txt"

* subject: Number of the test subject (1-30). Six rows per subject (one per activity -> 180 rows)

* activity: One of the following: (1) walking, (2) walking_upstairs, (3) walking_downstairs, (4) sitting, (5) standing, (6) laying. All six activity were recorded for each of the 30 subjects (->180 rows).

* The following columns contain means calculated for each subject and activity. Data are the output signals of the accelerometer sensors of the used smart phone. See data ssource for further information. Columns had the following names:

 "tBodyAccMeanX"            "tBodyAccMeanY"            "tBodyAccMeanZ"            "tBodyAccStdX"             "tBodyAccStdY"             "tBodyAccStdZ"             "tGravityAccMeanX"         "tGravityAccMeanY"         "tGravityAccMeanZ"         "tGravityAccStdX"          "tGravityAccStdY"          "tGravityAccStdZ"          "tBodyAccJerkMeanX"        "tBodyAccJerkMeanY"        "tBodyAccJerkMeanZ"        "tBodyAccJerkStdX"         "tBodyAccJerkStdY"         "tBodyAccJerkStdZ"         "tBodyGyroMeanX"           "tBodyGyroMeanY"           "tBodyGyroMeanZ"           "tBodyGyroStdX"            "tBodyGyroStdY"            "tBodyGyroStdZ"            "tBodyGyroJerkMeanX"       "tBodyGyroJerkMeanY"       "tBodyGyroJerkMeanZ"       "tBodyGyroJerkStdX"        "tBodyGyroJerkStdY"        "tBodyGyroJerkStdZ"        "tBodyAccMagMean"          "tBodyAccMagStd"           "tGravityAccMagMean"       "tGravityAccMagStd"        "tBodyAccJerkMagMean"      "tBodyAccJerkMagStd"       "tBodyGyroMagMean"         "tBodyGyroMagStd"          "tBodyGyroJerkMagMean"     "tBodyGyroJerkMagStd"      "fBodyAccMeanX"            "fBodyAccMeanY"            "fBodyAccMeanZ"            "fBodyAccStdX"             "fBodyAccStdY"             "fBodyAccStdZ"             "fBodyAccJerkMeanX"        "fBodyAccJerkMeanY"        "fBodyAccJerkMeanZ"        "fBodyAccJerkStdX"         "fBodyAccJerkStdY"         "fBodyAccJerkStdZ"         "fBodyGyroMeanX"           "fBodyGyroMeanY"           "fBodyGyroMeanZ"           "fBodyGyroStdX"            "fBodyGyroStdY"            "fBodyGyroStdZ"            "fBodyAccMagMean"          "fBodyAccMagStd"           "fBodyBodyAccJerkMagMean"  "fBodyBodyAccJerkMagStd"   "fBodyBodyGyroMagMean"     "fBodyBodyGyroMagStd"      "fBodyBodyGyroJerkMagMean" "fBodyBodyGyroJerkMagStd" 



