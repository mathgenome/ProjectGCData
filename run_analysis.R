#Getting and Cleaning Data
#Course project
#Smarthpone data
#URL raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#Setting my home directory:
setwd("/Users/Tecolotl/courses/autocursos/RCoursera/GettingCleaninigData/project/UCI HAR Dataset")
#Getting training data
x_train<-read.table("train/X_train.txt",head=FALSE)
dim(x_train)
y_train<-read.table("train/y_train.txt",head=FALSE)
dim(y_train)
#y_train is the activity type
#---Subjects
subject_train<-read.table("train/subject_train.txt",head=FALSE)
#Getting test data
x_test<-read.table("test/X_test.txt",head=FALSE)
dim(x_test)
y_test<-read.table("test/y_test.txt",head=FALSE)
dim(y_test)
#---Subjects
subject_test<-read.table("test/subject_test.txt",head=FALSE)
dim(subject_test)
#----------------------------------------------------------------+
#1. Merging the training and the test sets to create one data set|
#----------------------------------------------------------------+
#Merging data
x.merged<-rbind(x_train,x_test)
#-------------------------------------------------------------------------------------------+
#2. Extracting only the measurements on the mean and standard deviation for each measurement|
#-------------------------------------------------------------------------------------------+
#Features
feature.var<-read.table("features.txt",head=FALSE)
dim(feature.var)
#---Variables
var.set<-feature.var[,2]
var.set<-as.character(var.set) #Since it appears as factor
#---Selecting those with mean or std on their names
grep.mean<-grep("mean",var.set)
grep.std<-grep("std",var.set)
sel.mean.std<-union(grep.mean,grep.std)
#Sort selected variabl indices in ascending order
sel.mean.std<-sort(sel.mean.std)
#Select a subset of the data frame, with variables containing mean or std
x.selected<-x.merged[,sel.mean.std]
dim(x.selected)
#Name the columns
names(x.selected)<-var.set[sel.mean.std]
#-----------------------------------------------------------------------------------------+
#3. Using descriptive activity names to name the activities in the data set               |
#-----------------------------------------------------------------------------------------+
#Table of labels and activities
activity.labels<-read.table("activity_labels.txt",head=FALSE)
activity.labels
#Generating the vector of activity codes corresponding to the selected data frame
activity.codes<-c(y_train[,1],y_test[,1]) #y_train and y_test are data frames
#Funtion to transform code to activity
my.activity<-function(x){activity.labels[x,2]} #notice that the activity code corresponds to the row number
#Apply this function to the whole vector of coded activities
activity<-sapply(activity.codes,my.activity)
#Data frame with the first column as activity names "activity"
x.selected<-cbind(activity,x.selected)
names(x.selected)
#Adding the column of subjects
subject<-c(subject_train[,1],subject_test[,1])
x.selected<-cbind(subject,x.selected)
names(x.selected)
#-----------------------------------------------------------------------------------------+
#4. Appropriately labeling the data set with descriptive variable names.                  |
#-----------------------------------------------------------------------------------------+
#Already labeled in step 3
#-----------------------------------------------------------------------------------------+
#5. Creating a second, independent tidy data set with the average of each variable for    | 
#each activity and each subject.                                                          |
#-----------------------------------------------------------------------------------------+
tidy.summary<-aggregate(x.selected[-c(1,2)],list(activity=x.selected$activity,subject=x.selected$subject),FUN=mean)
dim(tidy.summary)
#180 corresponds to 6 (activities) x 30 (subjects). 81 corresponds to subject + activity + 79 variables
#I wrote the tidy data with: write.csv(tidy.summary,file="tidyData.csv",row.names=FALSE)
#Output generated in
date()
#  ^   ^
#  O   O
# (      )
#   A  A
#Humberto Reyes
