# Introduction

The script `run_analysis.R`performs the 5 steps described in the README.md

* First, read data using read.table(),the datasets we need is:

	1.`x_train.txt/x_test.txt`: which include numeric datas of varible features
	
	2.`y_train.txt/y_test.txt`: which include interger flags of activities of every features above
	
	3.`subject_x.txt/subject_y.txt`: which includes interger flags of subjects
	
	4.`features.txt`: which includes feature names of every feature types
	
	5.`activity_labels.txt`: which describes the relationship between interger flags and activity types
	
* Merge train and test datasets using rbind(), so we get one features data frame, one activity data frame, and one subject data frame.
* Merge all three data frames using cbind().
* Then, select only those columns with the mean and standard deviation measures to get a subset. After extracting these columns, they are given the correct names, taken from `features.txt`.
* We use for() loop for taking the activity names from `activity_labels.txt`, then give those names to the 'activity' column.
* On the whole subset, all columns with vague column names are corrected.
* Finally, we generate a new dataset with all the average measures for each subject and activity, and output it to a .txt file.
