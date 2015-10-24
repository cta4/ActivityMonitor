# ActivityMonitor

To create the tidy data set the following steps were carried out with the file run_analysis.R:

1. Read in file with feature names
  - Filter in just the standard deviation and mean names and save separately from above
2. Read in and combine activity codes from training and test files.
3. Read in and combine subject_ids from training and test files.
4. Read in and combine measurement data from training and test files.
5.Set column names of measurement file using the unfiltered set from step 1
6 Remove columns from measurement data using filtered set of columns from step 1
7. Combine as columns, subject_id and activity codes with measurement data
8. Read in data file with activity labels
9. Replace activity code values with readable activity labels from step 8
10. Make tidy data set by:
  - Group large data set by subject and activity
  - Calculate and save mean of each subject by activity and by each column/feature
  - save tidy dataset to file

This dataset is distilled from a larger dataset available at the University of California Irvine - Center for Machine Learning and Intelligent Systems. http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  (UC Irvine dataset) The rest of this document comes directly from there.

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Feature Selection 
=================

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
