##Code Book##

For each record in the dataset it is provided:
- subject_id  - 1 - 30 
- activity - human readable description of activity being measured. There are six distinct activities
- The remaining 66 columns are the mean of each mean or standard deviation measurement of each subject and activity by feature from the original UC Irvine dataset.

The 66 measurements / Features (column heads) recorded are listed in ActivityMeasure.txt and described in README.

- Measurements are normalized and bounded within [-1,1].
- The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
- The gyroscope units are radians/second.
- Each subject had each activity and feature measured multiple times. The Measurements in this dataset are the mean of each subject activity feature