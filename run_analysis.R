rm(list=ls())
setwd("/Users/carl/Projects/Coursera/coursera/Cleaning/ActivityMonitor/UCI_HAR_Dataset")

library(data.table)
library(stringr)
library(dplyr)

# read in file with column names 
features <- read.table("features.txt", stringsAsFactors = FALSE)
# get logical vector of columns I want
b_ciw <- str_detect(features$V2, fixed("mean()")) | str_detect(features$V2, fixed("std()"))


# read in data file with activity codes - join two sets - delete unneaded
train_y_train <- read.table("train/y_train.txt")
test_y_test <- read.table("test/y_test.txt")
activity_join <- data.table(rbind(train_y_train, test_y_test))
remove(train_y_train)
remove(test_y_test)
# read in data files with subject ids
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")
all_subject <- data.table(rbind(subject_train, subject_test))
remove(subject_train)
remove(subject_test)


# read in data sets - join two sets - delete unneaded
train_x_train <- read.table("train/x_train.txt")
test_x_test <- read.table("test/x_test.txt")
full_data <- data.table(rbind(train_x_train, test_x_test))
remove(train_x_train)
remove(test_x_test)
# set column head names 
setnames(full_data, features$V2)

# extract just the columns that contain mean or std - use logical vector
columnNames <- names(full_data)
c_ciw <- columnNames[b_ciw] 
# save column names for use in code book
write.table(c_ciw, "ActivityMeasure.txt", row.name=FALSE)


# subset by column just std and mean columns
myDataMeanStd = subset(full_data, select = c(c_ciw))
remove(full_data)
remove(b_ciw)
remove(c_ciw)
remove(columnNames)
# join activity codes and subject ids to dataset

myDataMeanStd <- cbind(activity = activity_join$V1, subject_id = all_subject$V1, myDataMeanStd)
remove(activity_join)
remove(features)
remove(all_subject) 

# read in data file with activity labels
activity_labels <- read.table("activity_labels.txt", stringsAsFactors = FALSE)

# replace activity code values with readable activity_lables
myDataMeanStd$activity <- plyr::mapvalues(myDataMeanStd$activity, activity_labels$V1, activity_labels$V2) 
remove(activity_labels)

# make tidy dataset
final <- myDataMeanStd %>%
  group_by( subject_id, activity) %>%
  summarise_each(funs(mean)) %>%
  arrange(subject_id, activity)

rm(myDataMeanStd)

write.table(final, "Activity.txt", row.name=FALSE)
