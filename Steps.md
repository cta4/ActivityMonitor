To create the tidy data set the following steps were carried out with the file run_analysis.R:

1. Read in file with feature names
  - Filter in just the standard deviation and mean names and save separately from above
  - Clean up column names to be valid R variable names.
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
