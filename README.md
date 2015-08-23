This is the course project for the Getting and Cleaning Data Coursera course. 
The R script, run_analysis.R, does the following:

###Get the data.
Download the file in the data folder and Unzip the file in "UCI HAR Dataset" folder.

###Step 1: Read and merges the training and the test sets to create an new data set
* There are 3 files for the train data:
  * X_train.txt
  * y_train.txt
  * subject_train.txt
* And 3 files for the test data:
  * X_test.txt
  * y_test.txt
  * subject_test.txt
* Use read.table() command to read the text files into the variables(Activity, Subject and Features).
* Use rbind function to concatenate the data tables(datSubject, datActivity and datFeatures) by rows.
* Set names to variables with names function.
* Merge columns to get the data frame **Data** for all data(Activity, Subject and Features).

###Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
* The objective of this step is to extract features with the word "mean" and "std".
* Use grep function to subset name of features on the word **mean** and **std** and assign to subdataFeaturesNames.
* Subset the data frame **Data** from step 2 with subset function by selected names of features.

###Step 3: Uses descriptive activity names to name the activities in the data set
* The objective of this step is to map the activity labels to their actual activity names.
* Read descriptive activity names from **activity_labels.txt**.
* Replace **activity** variable in **Data** using descriptive activity names.

###Step 4: Appropriately labels the data set with descriptive variable names
* Variables activity and subject and names of the activities have been labelled using descriptive names in Step 1 and Step 3.
* In this step, names of Features will labelled using descriptive variable names.
  * prefix t is replaced by time
  * f is replaced by frequency
  * Acc is replaced by Accelerometer
  * Gyro is replaced by Gyroscope
  * Mag is replaced by Magnitude
  * BodyBody is replaced by Body
       
###Step 5: Creates a second, independent tidy data set and output it
* In this step, a second, independent tidy data set **Data2** will be created with the average of each variable for each activity and each subject based on the data set in Step 4.
* The last step is to get the aggregated information with plyr package.
* Finally, output a file named "tidydata.txt".

prepared by Siew Hong
