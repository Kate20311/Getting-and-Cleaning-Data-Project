# 1.Merges the training and the test sets to create one data set.

## Unzip
### Download the file and put the file under the working directory,then

list <- unzip("getdata_projectfiles_UCI HAR Dataset.zip")

## Data Loading

xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt")

## Merge

Mergedtrain <- cbind(train_subject, ytrain, xtrain)
Mergedtest <- cbind(test_subject, ytest, xtest)
Data_all <- rbind(Mergedtrain, Mergedtest)

# 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

## Load feature name

feature_name <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)[,2]

## Get mean & standard deviation

feature_index <- grep(("mean\\(\\)|std\\(\\)"), feature_name)
final_data <- Data_all[, c(1, 2, feature_index+2)]
colnames(final_data) <- c("subject", "activity", feature_name[feature_index])

# 3. Uses descriptive activity names to name the activities in the data set

## Load activity data

activity_name <- read.table("./UCI HAR Dataset/activity_labels.txt")

## Use activity names to replace 1 to 6

final_data$activity <- factor(final_data$activity, levels = activity_name[,1], labels = activity_name[,2])

# 4. Appropriately labels the data set with descriptive variable names.

names(final_data) <- gsub("\\()", "", names(final_data))
names(final_data) <- gsub("^t", "time", names(final_data))
names(final_data) <- gsub("^f", "frequence", names(final_data))
names(final_data) <- gsub("-mean", "Mean", names(final_data))
names(final_data) <- gsub("-std", "Std", names(final_data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## import the package

library(dplyr)

groupData <- final_data %>%
        group_by(subject, activity) %>%
        summarise_each(funs(mean))

write.table(groupData, "MeanData.txt", row.names = FALSE)

