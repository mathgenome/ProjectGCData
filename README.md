Getting and Cleaning Data
================================
# Course project

In this project I work with a Human Activity Recognition Using Smartphones Dataset (Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto). The url for the raw data is: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data set comprises training and test data for 561 motion variables in 30 subjects with 6 different activities. The training data set represents a randomly selected 70% of the original data, whereas the test data represents a 30% of the original.

The script [run_analysis.R](https://github.com/mathgenome/ProjectGCData/blob/master/run_analysis.R) merges the training and test set in a single data set. Then it extracts the variables related to mean and standard deviation of measurements. It generates a data set with a column for activity in a descriptive way, a column for subject and columns for the selected variables, i.e. those related to mean and standar deviation of measurements.

Finally, it creates a tidy data set (tidyData.csv) with the average of each variable for each activity and each subject. A description of the variables for this data set is in CodeBook.md.

