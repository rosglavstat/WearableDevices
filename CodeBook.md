##Getting and cleaning data. Course project. Code Book.

###Main files

README.md - contains the objectives of the project and the description of the algorithm
CodeBook.md - contains the description of files and variables.
run_analysis.R - the only R script file in the repo that performs all the transformations with the initial data and returns the tidy dataset.

###Additional files

These files will be downloaded by run_analysis.R 

zipped_data.zip - zipped initial data 
Folder “UCI HAR Dataset” - unzipped data
make sure you read README.txt in the unzipped folder to understand the data better.
WearableDevicesTidyDataSet.csv - the output file with tidy data

###Variables used

fileUrl - used to store the web-address of the file with the initial data
xtrain - data frame to store X_train.txt file contents
xtest - data frame to store X_test.txt file contents
x - merged xtrain and xtest, full experrimental data


subjecttrain  - data frame to store subject_train.txt file contents
subjecttest - data frame to store subject_test.txt file contents
subject merged subjecttrain and subjecttest data. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

ytrain - data frame to store y_train.txt file contents
ytest - data frame to store y_train.txt file contents
y <- merged ytrain and ytest. Data labels (activities list)

activitylabels - Links the class labels with their activity name (from activity_labels.txt)
features - List of all features (from features.txt)
featurevector <- 2 column of features data frame, containing names only

index - logical vector of whether the column name contains mean or str
xshort - experimental data with reduced number of columns - only means and standard deviations

combined - data frame including all the components needed
combinedaggr - “combine” data frame with data aggregated by subjects and activities - final data frame 
