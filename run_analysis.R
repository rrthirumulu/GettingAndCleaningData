# Before beginning, we must load the reshape package that will be used later

library(reshape2)

## STEP 1: Merges the training and the test sets to create one data set

# assign data from text files into data frames
subject_train <- read.table("subject_train.txt")
subject_test <- read.table("subject_test.txt")
X_train <- read.table("X_train.txt")
X_test <- read.table("X_test.txt")
y_train <- read.table("y_train.txt")
y_test <- read.table("y_test.txt")

# assign names for the columns of the subject files
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

# add names for columns of measurements
featureNames <- read.table("features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# add column names for labels
names(y_train) <- "activity"
names(y_test) <- "activity"

# the following segment combines data into one table
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combined <- rbind(train, test)


## STEP 2: Extracts only the measurements on the mean and standard
## deviation for each measurement.

# determine which columns contain "mean()" or "std()"
meanstdcols <- grepl("mean\\(\\)", names(combined)) |
  grepl("std\\(\\)", names(combined))

# ensure that we also keep the subjectID and activity columns
meanstdcols[1:2] <- TRUE

# remove unnecessary columns
combined <- combined[, meanstdcols]


## STEP 3: Uses descriptive activity names to name the activities
## in the data set.
## STEP 4: Appropriately labels the data set with descriptive
## activity names. 

# convert the activity column from integer to factor
combined$activity <- factor(combined$activity, labels=c("Walking",
                                                        "Walking Upstairs", 
                                                        "Walking Downstairs", 
                                                        "Sitting", 
                                                        "Standing", 
                                                        "Laying"))


## STEP 5: Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.

# create/write the tidy data set to tidy.csv
meltdata <- melt(combined, id=c("subjectID","activity"))
tidydata <- dcast(meltdata, subjectID+activity ~ variable, mean)
write.csv(tidydata, "tidy.csv", row.names=FALSE)