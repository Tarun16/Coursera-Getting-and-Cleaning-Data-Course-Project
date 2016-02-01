##creating a folder, downloading the file and unzipping it

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/dataset.zip")
unzip(zipfile="./data/dataset.zip",exdir="./getdata")

##STEP 1:

##reading test data for set, label and subject
x_testData <-read.table("getdata/UCI HAR Dataset/test/X_test.txt")
y_testData <-read.table("getdata/UCI HAR Dataset/test/y_test.txt")
subject_testData <- read.table("getdata/UCI HAR Dataset/test/subject_test.txt")

##reading train data for set, label and subject
x_trainData <- read.table("getdata/UCI HAR Dataset/train/X_train.txt")
y_trainData <- read.table("getdata/UCI HAR Dataset/train/y_train.txt")
subject_trainData <- read.table("getdata/UCI HAR Dataset/train/subject_train.txt")

##reading the features data to get column names
features_data <- read.table("getdata/UCI HAR Dataset/features.txt")

##merging set data for test and training together
x_complete <- rbind(x_testData, x_trainData)

## merging label data for test and training together
y_complete <- rbind(y_testData, y_trainData)

##merging subject data for test and training together
subject_complete <- rbind(subject_testData, subject_trainData)

## making the column names similar to feature data for subsetting 
names(x_complete) <- gsub("V","",names(x_complete))

##subsetting the merged set data to get desired column names rather than V1,V2,V3 etc..
names(x_complete) <- features_data[names(x_complete),2]

##renaming the column in merged label data
names(y_complete) <- c("Activity")

##renaming the column in merged subject data
names(subject_complete) <- c("Subject")

##merging all the three data above to get the final data asked in step 1
final_data <- cbind(x_complete,subject_complete,y_complete)

## STEP 2:

##extracting only the measurements on the mean and standard deviation
subset_features <- features_names[grep("mean\\(\\)|std\\(\\)", features_names)]

##converting them to characters and adding two more elements
subset_features_final <- c(as.character(subset_features),"Subject","Activity")

##Subsetting the final data according to mean and S.D. to complete step 2
final_data <- final_data[,subset_features_final]

## STEP 3:

##reading activity_labels
activity_labels <- read.table("getdata/UCI HAR Dataset/activity_labels.txt")

##Subsetting the activity column to match descriptive activity names and complete step 3
final_data$Activity <- activity_labels[final_data$Activity,2]

## STEP 4:

##changing the variable names to be more descriptive
names(final_data)<-gsub("^t", "time", names(final_data))
names(final_data)<-gsub("^f", "frequency", names(final_data))
names(final_data)<-gsub("Mag", "Magnitude", names(final_data))
names(final_data)<-gsub("Acc", "Accelerometer", names(final_data))
names(final_data)<-gsub("Gyro", "Gyroscope", names(final_data))
names(final_data)<-gsub("BodyBody", "Body", names(final_data))

## STEP 5:

##Using the plyr library and the aggregate function to get an independent data set

library(plyr);
tidy <-aggregate(. ~Subject + Activity, final_data, mean)
tidy <-tidy[order(tidy$Subject,tidy$Activity),]
write.table(tidy, file = "tidydataset.txt",row.name=FALSE)
