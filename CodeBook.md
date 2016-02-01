# Variable names used in R code

	1.x_testData, y_testData, subject_testData contain the test data from the downloaded files.
	2.x_trainData, y_trainData, subject_trainData contain the training data from the downloaded files.
	3.x_complete, y_complete, subject_complete contain the merged set, label and subject data respectively.
	4.final_data contains the data after merging the above three sets together.
	5.subset_features contains the features data subsetted according to the required measurements.
	6."tidydataset.txt" contains the relevant average data set in the ordered form.

# The modified column names 

	1.Variables starting with 't' are replaced with "time".{Ex : tBodyAcc-mean()-X TO timeBodyAcc-mean()-X}
	2.Variables starting with 'f' are replaced with "frequency".{Ex : fBodyAccJerk-std()-Z TO frequencyBodyAccJerk-std()-Z}
	3.Variables containing word 'Mag' are replaced with "Magnitude".{Ex: fBodyAccMag-mean() TO fBodyAccMagnitude-mean()}
	4.Variables containing word 'Acc' are replaced with "Accleration".{Ex: fBodyAccMag-std() TO fBodyAccelerationMag-std()}
	5.Variables containing word 'Gyro' are replaced with "Gyroscope".{Ex : fBodyGyro-std()-Y  TO fBodyGyroscope-std()-Y} 
	6.Variables containing word 'BodyBody' are replaced with "Body".{Ex : fBodyBodyAccJerkMag-std() TO fBodyAccJerkMag-std()}

#Activity Labels

	1.WALKING (value 1): subject was walking during the test
    	2.WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test
    	3.WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test
    	4.SITTING (value 4): subject was sitting during the test
    	5.STANDING (value 5): subject was standing during the test
    	6.LAYING (value 6): subject was laying down during the test
