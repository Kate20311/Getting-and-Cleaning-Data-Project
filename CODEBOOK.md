# Codebook

This code book describes the variables, data, and transformations applied to the Human Activity Recognition Using Smartphones Dataset. The dataset was originally obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables
The dataset consists of the following variables:

1. `subject`: Identifier for the subject who performed the activity.
2. `activity`: The activity performed by the subject. The activities are labeled as follows:
   - WALKING
   - WALKING_UPSTAIRS
   - WALKING_DOWNSTAIRS
   - SITTING
   - STANDING
   - LAYING

The activity labels were originally numeric (1 to 6) and have been replaced with descriptive names using the `activity_labels.txt` file.

## Data Transformations

The following transformations were applied to the data:
1. **Merging Data**: The training and test sets were merged into a single dataset.
2. **Feature Selection**: Only the mean and standard deviation features were extracted from the dataset.
3. **Feature Naming**: The feature names were modified to be more descriptive. The transformations applied to the feature names include:
   - Removing parentheses `(` and `)`.
   - Replacing `t` with `time` to indicate time domain features.
   - Replacing `f` with `frequence` to indicate frequency domain features.
   - Adding the word `Mean` after `-mean` to indicate mean values.
   - Adding the word `Std` after `-std` to indicate standard deviation values.

## Data Summary

The final dataset includes the following summaries:

- For each subject and activity, the average of each variable is calculated. This is done to create a second, independent tidy dataset that can be used for further analysis.

## Script Information

The R script `run_analysis.R` performs the following steps:

1. Merges the training and test sets.
2. Extracts only the mean and standard deviation measurements.
3. Renames activities with descriptive names.
4. Appropriately labels the dataset with descriptive variable names.
5. Creates a second, independent tidy dataset with the average of each variable for each activity and each subject.

The script uses the `dplyr` package for data manipulation and the final grouped data is written to a file named `MeanData.txt`.