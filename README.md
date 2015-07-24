# Getting and Clearning Data - Course Project

---

This repository includes a R script and relevant files for the “Getting and Cleaning Data” course project on Coursera which hosts by John Hopkins University.

#Files

---

* `run_analysis.R` is a R script contains all codes needed for analyse the dataset
* `tidydata.txt` is the output tidy dataset from above
* `CodeBook.md` describes the variables in `tidydata.txt`

#Performming

---

The original dataset being used is from [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

You should unzip the data folder in your working directory.

When running `run_analysis.R` in R or Rstudio, it will perform the 5 steps below:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.