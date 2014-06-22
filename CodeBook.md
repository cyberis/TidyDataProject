# Code Book
This is the code book for the single tidy data set (***UCITidyData.txt***) that is created by the processing script, run_analysis.R.

## File Description
The tidy data set is contained in a file named UCITidyData.txt. It is a space delimited text file with 181 rows (incuding 1 header row) with 68 observations (1 subject id, 1 activity name and 66 feature variables). The data consists of one row per subject (1-30) performing six different activities (Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying down) with the average of 66 different measurements taken for each combination of subject and activity. The data is orderd by subject id and then by activity as listed above. Thus there are 180 (30 subjects * 6 Activities) rows of summarized data.

## Data Columns
The column layout and mapping from the original is listed below:

Col # | Origin File | Column Name | New Col # | Original Col # | Original Column Name
----- | ----------- | ----------- | --------- | -------------- | --------------------
01 | subject_*.txt | Subject.ID | Col 1 | Col 1 | N/A
02 | y_*.txt | Activity | Col 1 | Col 1 | N/A
03 | X_*.txt | Mean.BodyAccelerationTime.X |  Col  1 | Col   1 | tBodyAcc-mean()-X
04 | X_*.txt | Mean.BodyAccelerationTime.Y |  Col  2 | Col   2 | tBodyAcc-mean()-Y
05 | X_*.txt | Mean.BodyAccelerationTime.Z |  Col  3 | Col   3 | tBodyAcc-mean()-Z
06 | X_*.txt | STD.BodyAccelerationTime.X |  Col  4 | Col   4 | tBodyAcc-std()-X
07 | X_*.txt | STD.BodyAccelerationTime.Y |  Col  5 | Col   5 | tBodyAcc-std()-Y
08 | X_*.txt | STD.BodyAccelerationTime.Z |  Col  6 | Col   6 | tBodyAcc-std()-Z
09 | X_*.txt | Mean.GravityAccelerationTime.X |  Col  7 | Col  41 | tGravityAcc-mean()-X
10 | X_*.txt | Mean.GravityAccelerationTime.Y |  Col  8 | Col  42 | tGravityAcc-mean()-Y
11 | X_*.txt | Mean.GravityAccelerationTime.Z |  Col  9 | Col  43 | tGravityAcc-mean()-Z
12 | X_*.txt | STD.GravityAccelerationTime.X |  Col 10 | Col  44 | tGravityAcc-std()-X
13 | X_*.txt | STD.GravityAccelerationTime.Y |  Col 11 | Col  45 | tGravityAcc-std()-Y
14 | X_*.txt | STD.GravityAccelerationTime.Z |  Col 12 | col  46 | tGravityAcc-std()-Z
15 | X_*.txt | Mean.BodyAccelerationJerkTime.X |  Col 13 | Col  81 | tBodyAccJerk-mean()-X
16 | X_*.txt | Mean.BodyAccelerationJerkTime.Y |  Col 14 | Col  82 | tBodyAccJerk-mean()-Y
17 | X_*.txt | Mean.BodyAccelerationJerkTime.Z |  Col 15 | Col  83 | tBodyAccJerk-mean()-Z
18 | X_*.txt | STD.BodyAccelerationJerkTime.X |  Col 16 | Col  84 | tBodyAccJerk-std()-X
19 | X_*.txt | STD.BodyAccelerationJerkTime.Y |  Col 17 | Col  85 | tBodyAccJerk-std()-Y
20 | X_*.txt | STD.BodyAccelerationJerkTime.Z |  Col 18 | Col  86 | tBodyAccJerk-std()-Z
21 | X_*.txt | Mean.BodyGyroscopeTime.X |  Col 19 | Col 121 | tBodyGyro-mean()-X
22 | X_*.txt | Mean.BodyGyroscopeTime.Y |  Col 20 | Col 122 | tBodyGyro-mean()-Y
23 | X_*.txt | Mean.BodyGyroscopeTime.Z |  Col 21 | Col 123 | tBodyGyro-mean()-Z
24 | X_*.txt | STD.BodyGyroscopeTime.X |  Col 22 | Col 124 | tBodyGyro-std()-X
25 | X_*.txt | STD.BodyGyroscopeTime.Y |  Col 23 | Col 125 | tBodyGyro-std()-Y
26 | X_*.txt | STD.BodyGyroscopeTime.Z |  Col 24 | Col 126 | tBodyGyro-std()-Z
27 | X_*.txt | Mean.BodyGyroscopeJerkTime.X |  Col 25 | Col 161 | tBodyGyroJerk-mean()-X
28 | X_*.txt | Mean.BodyGyroscopeJerkTime.Y |  Col 26 | Col 162 | tBodyGyroJerk-mean()-Y
29 | X_*.txt | Mean.BodyGyroscopeJerkTime.Z |  Col 27 | Col 163 | tBodyGyroJerk-mean()-Z
30 | X_*.txt | STD.BodyGyroscopeJerkTime.X |  Col 28 | Col 164 | tBodyGyroJerk-std()-X
31 | X_*.txt | STD.BodyGyroscopeJerkTime.Y |  Col 29 | Col 165 | tBodyGyroJerk-std()-Y
32 | X_*.txt | STD.BodyGyroscopeJerkTime.Z |  Col 30 | Col 166 | tBodyGyroJerk-std()-Z
33 | X_*.txt | Mean.BodyAccelerationMagnitudeTime |  Col 31 | Col 201 | tBodyAccMag-mean()
34 | X_*.txt | STD.BodyAccelerationMagnitudeTime |  Col 32 | Col 202 | tBodyAccMag-std()
35 | X_*.txt | Mean.GravityAccelerationMagnitudeTime |  Col 33 | Col 214 | tGravityAccMag-mean()
36 | X_*.txt | STD.GravityAccelerationMagnitudeTime |  Col 34 | Col 215 | tGravityAccMag-std()
37 | X_*.txt | Mean.BodyAccelerationJerkMagnitudeTime |  Col 35 | Col 227 | tBodyAccJerkMag-mean()
38 | X_*.txt | STD.BodyAccelerationJerkMagnitudeTime |  Col 36 | Col 228 | tBodyAccJerkMag-std()
39 | X_*.txt | Mean.BodyGyroscopeMagnitudeTime |  Col 37 | Col 240 | tBodyGyroMag-mean()
40 | X_*.txt | STD.BodyGyroscopeMagnitudeTime |  Col 38 | Col 241 | tBodyGyroMag-std()
41 | X_*.txt | Mean.BodyGyroscopeJerkMagnitudeTime |  Col 39 | Col 253 | tBodyGyroJerkMag-mean()
42 | X_*.txt | STD.BodyGyroscopeJerkMagnitudeTime |  Col 40 | Col 254 | tBodyGyroJerkMag-std()
43 | X_*.txt | Mean.BodyAccelerationFreq.X |  Col 41 | Col 266 | fBodyAcc-mean()-X
44 | X_*.txt | Mean.BodyAccelerationFreq.Y |  Col 42 | Col 267 | fBodyAcc-mean()-Y
45 | X_*.txt | Mean.BodyAccelerationFreq.Z |  Col 43 | Col 268 | fBodyAcc-mean()-Z
46 | X_*.txt | STD.BodyAccelerationFreq.X |  Col 44 | Col 269 | fBodyAcc-std()-X
47 | X_*.txt | STD.BodyAccelerationFreq.Y |  Col 45 | Col 270 | fBodyAcc-std()-Y
48 | X_*.txt | STD.BodyAccelerationFreq.Z |  Col 46 | Col 271 | fBodyAcc-std()-Z
49 | X_*.txt | Mean.BodyAccelerationJerkFreq.X |  Col 47 | Col 345 | fBodyAccJerk-mean()-X
50 | X_*.txt | Mean.BodyAccelerationJerkFreq.Y |  Col 48 | Col 346 | fBodyAccJerk-mean()-Y
51 | X_*.txt | Mean.BodyAccelerationJerkFreq.Z |  Col 49 | Col 347 | fBodyAccJerk-mean()-Z
52 | X_*.txt | STD.BodyAccelerationJerkFreq.X |  Col 50 | Col 348 | fBodyAccJerk-std()-X
53 | X_*.txt | STD.BodyAccelerationJerkFreq.Y |  Col 51 | Col 349 | fBodyAccJerk-std()-Y
54 | X_*.txt | STD.BodyAccelerationJerkFreq.Z |  Col 52 | Col 350 | fBodyAccJerk-std()-Z
55 | X_*.txt | Mean.BodyGyroscopeFreq.X |  Col 53 | Col 424 | fBodyGyro-mean()-X
56 | X_*.txt | Mean.BodyGyroscopeFreq.Y |  Col 54 | Col 425 | fBodyGyro-mean()-Y
57 | X_*.txt | Mean.BodyGyroscopeFreq.Z |  Col 55 | Col 426 | fBodyGyro-mean()-Z
58 | X_*.txt | STD.BodyGyroscopeFreq.X |  Col 56 | Col 427 | fBodyGyro-std()-X
59 | X_*.txt | STD.BodyGyroscopeFreq.Y |  Col 57 | Col 428 | fBodyGyro-std()-Y
60 | X_*.txt | STD.BodyGyroscopeFreq.Z |  Col 58 | Col 429 | fBodyGyro-std()-Z
61 | X_*.txt | Mean.BodyAccelerationMagnitudeFreq |  Col 59 | Col 503 | fBodyAccMag-mean()
62 | X_*.txt | STD.BodyAccelerationMagnitudeFreq |  Col 60 | Col 504 | fBodyAccMag-std()
63 | X_*.txt | Mean.BodyAccelerationJerkMagnitudeFreq |  Col 61 | Col 516 | fBodyBodyAccJerkMag-mean()
64 | X_*.txt | STD.BodyAccelerationJerkMagnitudeFreq |  Col 62 | Col 517 | fBodyBodyAccJerkMag-std()
65 | X_*.txt | Mean.BodyGyroscopeMagnitudeFreq |  Col 63 | Col 529 | fBodyBodyGyroMag-mean()
66 | X_*.txt | STD.BodyGyroscopeMagnitudeFreq |  Col 64 | Col 530 | fBodyBodyGyroMag-std()
67 | X_*.txt | Mean.BodyGyroscopeJerkMagnitudeFreq |  Col 65 | Col 542 | fBodyBodyGyroJerkMag-mean()
68 | X_*.txt | STD.BodyGyroscopeJerkMagnitudeFreq |  Col 66 | Col 543 | fBodyBodyGyroJerkMag-std()

## Scripted Transformations
1. Downloaded the Zip file
2. Unzipped the zip file
3. Read the feature files (X_*.txt) using read.table() and then rewrote using write.table() to feature_*.txt. This was to remove the leading spaces which cause fread() to barf.
3. Used data.table::fread() to read in the files feature_*.txt, y_*.txt and subject_*.txt into data.tables (data.tables are MUCH faster than data.frames and scale very well to large data sets). Because I used fread() I could read in just the feature columns I needed very fast and not take up wasted memory for data I was going to throw away.
4. Added a factor to translate activity ids to activity names
5. Bound the Test Tables together with cbind() from subject to activity to features
6. Also used cbind on the Training Tables with cbind() from subject to activity to features
Used data.table::rbindlist() to bind the Training Data and Test data together. This is also much faster than rbind().
Set a key on the resulting data table using Subject and Activity name factor to sort the table.
7. Dropped the activity id column.
8. Used the melt and dcast functions to create a mean for every feature variable grouped by each unique combination of subject and activity.
9. Wrote out the resulting tidy data set to ./data/UCITidyData.txt

## Description of the raw feature data
This is taken directly from the code book in the original data set (README.txt and features.txt and feature_info.txt):

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Notes:
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

Feature Selection:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean


