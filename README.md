# Coursera-Getting-and-Cleaning-Data-Course-Project


This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:

    1.Download the dataset if it does not already exist in the working directory
    2.Load the set, label, subject and feature info.
    3.Merge the three datasets (set, label and subject) for training and test together to form a final data set.
    4.Subset the data sets according to the required measurements (mean and standard deviation).
    5.Use descriptive activity names given in activity_labels.txt to make the names more readable.
    6.Label the data set with descriptive variable names using gsub().
    7.Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The end result is shown in the file tidydataset.txt.