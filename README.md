#Getting and cleaning data. Course project 2.# 
##Description.##

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A description of the initial data is available in “UCI HAR Dataset” directory (downloaded by run_analysis.R script) - files README.txt and features_info.txt

All the transformations are performed by run_analysis.R script too.
It does the following:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set.
* Appropriately labels the data set with descriptive activity names. 
* Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

###The algorithm###

Read the data files X_train.txt and X_test.txt. Rbinds them.
Read the vector of subjects performing the activities from files subject_train.txt and subject_test.txt. Rbinds them
Read the vector of activities related to the measurements from files y_train.txt and y_test.txt. Rbinds them.
Read the dictionaries (activity codes to activity names and feature codes to feature names) from files activity_labels.txt and features.txt
Create vectors of readable names applying the dictionaries
Select only names containing mean() or std()
we get a vector of logical values whether an element is suitable or not
apply the logical vector, select only the columns with mean and std
Join subject list, activity list and the measurement data
Aggregate the data by unique pair "subject + activity", method - mean. (Count average values for every activity of every subject)
Make the column names more readable. Make sure they correspond to standarts and do not contain dashes and brackets.
Output the table to a file. Separator - semicolon.