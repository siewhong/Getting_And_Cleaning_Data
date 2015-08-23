This file consists of description about the variables and other information used in the script **run_analysis.R**   

### Background information

Reading the background information about the course project helps. It can be obtained [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Data Source

The dataset for this project can be download [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Variables and relevent information

1. trainData 
	- read data from X_train.txt
	- class = data frame
	- dim = 7352 x 561
2. trainLabel
	- read data from y_train.txt
	- class = data frame
	- dim = 7352 x 1
3. trainSubject
	- read data from subject_train.txt
	- class = data frame
	- dim = 7352 x 1
4. testData 
	- read data from X_test.txt
	- class = data frame
	- dim = 2947 x 561
5. testLabel
	- read data from y_test.txt
	- class = data frame
	- dim = 2947 x 1
6. testSubject
	- read data from subject_test.txt
	- class = data frame	
	- dim = 2947 x 1 
7. combineData
	- combine trainData and testData
	- class = data frame
	- dim = 10299 x 561
8. combineLabel 
	- combine trainLabel and testLabel
	- dim = 10299 x 1 
9. features
	- read data from features.txt
	- total of 561 features
10. featuresSelected
	- select only "mean" and "std"
	- total of 79
11. activity
	- read from activity_labels.txt
	- total of 6 different activity
12. cleanData
	- dim = 10299  x 81
13. tidyDataAverage
	- cleanData with mean for related columns
	- dim = 180 x 81
	
	
prepared by Siew Hong
	
	
	
	