#load libraries
library(plyr)

#Download data file from the web
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./zipped_data.zip", method = "curl")

#Unzip the downloaded file to the working directory
unzip("./zipped_data.zip", exdir="./")

#Read the main data. Separator - multiple spaces.
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt", sep="")

#Merge the training and the test sets to create one data set
x <- rbind(xtrain, xtest)

#Read the list of subjects
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names="subject")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names="subject")

#Merge the training and the test lists of subjects
subject <- rbind(subjecttrain, subjecttest)

#Read activities list
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names="act_label")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names="act_label")

#Merge the training and the test lists of activities
y <- rbind(ytrain, ytest)

#Read the dictionaries (activity codes to activity names and feature codes to feature names)
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names=c("act_label","act_name"))
features <- read.table("./UCI HAR Dataset/features.txt")

#Create vectors of readable names applying the dictionaries
activity <- merge(y,activitylabels)
featurevector <- features[,2]
names(x) <- features[,2] #chnange column names

#Select only names containing mean() or std()
index <- grepl("(mean\\(\\)|std\\(\\))", featurevector) #we get a vector of logical values whether an element is suitable or not
xshort <- x[,index] #apply the logical vector, select only the columns with mean and std

#Join subject list, activity list and the measurement data
combined <- cbind(subject, activity[,2], xshort)

#Aggregate the data by unique pair "subject + activity", method - mean. (Count average values for every activity of every subject)
combinedaggr <- ddply(combined, c("subject","activity[, 2]"), numcolwise(mean))

#Make the column names more readable. Make sure they correspond to standarts and do not contain dashes and brackets.
names(combinedaggr) <- gsub("\\(\\)","", names(combinedaggr))
names(combinedaggr) <- gsub("-","", names(combinedaggr))
names(combinedaggr) <- gsub("std","Std", names(combinedaggr))
names(combinedaggr) <- gsub("mean","Mean", names(combinedaggr))
names(combinedaggr)[2] <- "activity"

#Output the table to a file. Separator - semicolon.
write.table(combinedaggr, file = "./WearableDevicesTidyDataSet.csv", quote=FALSE, sep=";",  row.names = FALSE, na="0")
