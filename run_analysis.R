# run_analysis.R - Create a tidy data set for smartphone usage
# Created and Submitted by Christopher Bortz
# For Getting and Cleaning Data, Dr. J, Section 004, June 2 - 30, 2014
# Course Peer-Assessed Project

# Setup some global configuration variables
resetData <- FALSE  # If this is set to true, remove the data directory and start fresh

# Setup the Feature Columns that we want and user friendly (sort of) names for them
featureCols <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 
                 214:215, 227:228, 240:241, 253:254, 266:271, 345:350,
                 424:429, 503:504, 516:517, 529:530, 542:543)
featureNames <- c("Mean.BodyAccelerationTS.X",             # Col  1 <- Col   1: tBodyAcc-mean()-X
                  "Mean.BodyAccelerationTS.Y",             # Col  2 <- Col   2: tBodyAcc-mean()-Y
                  "Mean.BodyAccelerationTS.Z",             # Col  3 <- Col   3: tBodyAcc-mean()-Z
                  "STD.BodyAccelerationTS.X",              # Col  4 <- Col   4: tBodyAcc-std()-X
                  "STD.BodyAccelerationTS.Y",              # Col  5 <- Col   5: tBodyAcc-std()-Y
                  "STD.BodyAccelerationTS.Z",              # Col  6 <- Col   6: tBodyAcc-std()-Z
                  "Mean.GravityAccelerationTS.X",          # Col  7 <- Col  41: tGravityAcc-mean()-X
                  "Mean.GravityAccelerationTS.Y",          # Col  8 <- Col  42: tGravityAcc-mean()-Y
                  "Mean.GravityAccelerationTS.Z",          # Col  9 <- Col  43: tGravityAcc-mean()-Z
                  "STD.GravityAccelerationTS.X",           # Col 10 <- Col  44: tGravityAcc-std()-X
                  "STD.GravityAccelerationTS.Y",           # Col 11 <- Col  45: tGravityAcc-std()-Y
                  "STD.GravityAccelerationTS.Z",           # Col 12 <- col  46: tGravityAcc-std()-Z
                  "Mean.BodyAccelerationJerkTS.X",         # Col 13 <- Col  81: tBodyAccJerk-mean()-X
                  "Mean.BodyAccelerationJerkTS.Y",         # Col 14 <- Col  82: tBodyAccJerk-mean()-Y
                  "Mean.BodyAccelerationJerkTS.Z",         # Col 15 <- Col  83: tBodyAccJerk-mean()-Z
                  "STD.BodyAccelerationJerkTS.X",          # Col 16 <- Col  84: tBodyAccJerk-std()-X
                  "STD.BodyAccelerationJerkTS.Y",          # Col 17 <- Col  85: tBodyAccJerk-std()-Y
                  "STD.BodyAccelerationJerkTS.Z",          # Col 18 <- Col  86: tBodyAccJerk-std()-Z
                  "Mean.BodyGyroscopeTS.X",                # Col 19 <- Col 121: tBodyGyro-mean()-X
                  "Mean.BodyGyroscopeTS.Y",                # Col 20 <- Col 122: tBodyGyro-mean()-Y
                  "Mean.BodyGyroscopeTS.Z",                # Col 21 <- Col 123: tBodyGyro-mean()-Z
                  "STD.BodyGyroscopeTS.X",                 # Col 22 <- Col 124: tBodyGyro-std()-X
                  "STD.BodyGyroscopeTS.Y",                 # Col 23 <- Col 125: tBodyGyro-std()-Y
                  "STD.BodyGyroscopeTS.Z",                 # Col 24 <- Col 126: tBodyGyro-std()-Z
                  "Mean.BodyGyroscopeJerkTS.X",            # Col 25 <- Col 161: tBodyGyroJerk-mean()-X
                  "Mean.BodyGyroscopeJerkTS.Y",            # Col 26 <- Col 162: tBodyGyroJerk-mean()-Y
                  "Mean.BodyGyroscopeJerkTS.Z",            # Col 27 <- Col 163: tBodyGyroJerk-mean()-Z
                  "STD.BodyGyroscopeJerkTS.X",             # Col 28 <- Col 164: tBodyGyroJerk-std()-X
                  "STD.BodyGyroscopeJerkTS.Y",             # Col 29 <- Col 165: tBodyGyroJerk-std()-Y
                  "STD.BodyGyroscopeJerkTS.Z",             # Col 30 <- Col 166: tBodyGyroJerk-std()-Z
                  "Mean.BodyAccelerationMagnitudeTS",      # Col 31 <- Col 201: tBodyAccMag-mean()
                  "STD.BodyAccelerationMagnitudeTS",       # Col 32 <- Col 202: tBodyAccMag-std()
                  "Mean.GravityAccelerationMagnitudeTS",   # Col 33 <- Col 214: tGravityAccMag-mean()
                  "STD.GravityAccelerationMagnitudeTS",    # Col 34 <- Col 215: tGravityAccMag-std()
                  "Mean.BodyAccelerationJerkMagnitudeTS",  # Col 35 <- Col 227: tBodyAccJerkMag-mean()
                  "STD.BodyAccelerationJerkMagnitudeTS",   # Col 36 <- Col 228: tBodyAccJerkMag-std()
                  "Mean.BodyGyroscopeMagnitudeTS",         # Col 37 <- Col 240: tBodyGyroMag-mean()
                  "STD.BodyGyroscopeMagnitudeTS",          # Col 38 <- Col 241: tBodyGyroMag-std()
                  "Mean.BodyGyroscopeJerkMagnitudeTS",     # Col 39 <- Col 253: tBodyGyroJerkMag-mean()
                  "STD.BodyGyroscopeJerkMagnitudeTS",      # Col 40 <- Col 254: tBodyGyroJerkMag-std()
                  "Mean.BodyAccelerationFFT.X",            # Col 41 <- Col 266: fBodyAcc-mean()-X
                  "Mean.BodyAccelerationFFT.Y",            # Col 42 <- Col 267: fBodyAcc-mean()-Y
                  "Mean.BodyAccelerationFFT.Z",            # Col 43 <- Col 268: fBodyAcc-mean()-Z
                  "STD.BodyAccelerationFFT.X",             # Col 44 <- Col 269: fBodyAcc-std()-X
                  "STD.BodyAccelerationFFT.Y",             # Col 45 <- Col 270: fBodyAcc-std()-Y
                  "STD.BodyAccelerationFFT.Z",             # Col 46 <- Col 271: fBodyAcc-std()-Z
                  "Mean.BodyAccelerationJerkFFT.X",        # Col 47 <- Col 345: fBodyAccJerk-mean()-X
                  "Mean.BodyAccelerationJerkFFT.Y",        # Col 48 <- Col 346: fBodyAccJerk-mean()-Y
                  "Mean.BodyAccelerationJerkFFT.Z",        # Col 49 <- Col 347: fBodyAccJerk-mean()-Z
                  "STD.BodyAccelerationJerkFFT.X",         # Col 50 <- Col 348: fBodyAccJerk-std()-X
                  "STD.BodyAccelerationJerkFFT.Y",         # Col 51 <- Col 349: fBodyAccJerk-std()-Y
                  "STD.BodyAccelerationJerkFFT.Z",         # Col 52 <- Col 350: fBodyAccJerk-std()-Z
                  "Mean.BodyGyroscopeFFT.X",               # Col 53 <- Col 424: fBodyGyro-mean()-X
                  "Mean.BodyGyroscopeFFT.Y",               # Col 54 <- Col 425: fBodyGyro-mean()-Y
                  "Mean.BodyGyroscopeFFT.Z",               # Col 55 <- Col 426: fBodyGyro-mean()-Z
                  "STD.BodyGyroscopeFFT.X",                # Col 56 <- Col 427: fBodyGyro-std()-X
                  "STD.BodyGyroscopeFFT.Y",                # Col 57 <- Col 428: fBodyGyro-std()-Y
                  "STD.BodyGyroscopeFFT.Z",                # Col 58 <- Col 429: fBodyGyro-std()-Z
                  "Mean.BodyAccelerationMagnitudeFFT",     # Col 59 <- Col 503: fBodyAccMag-mean()
                  "STD.BodyAccelerationMagnitudeFFT",      # Col 60 <- Col 504: fBodyAccMag-std()
                  "Mean.BodyAccelerationJerkMagnitudeFFT", # Col 61 <- Col 516: fBodyBodyAccJerkMag-mean()
                  "STD.BodyAccelerationJerkMagnitudeFFT",  # Col 62 <- Col 517: fBodyBodyAccJerkMag-std()
                  "Mean.BodyGyroscopeMagnitudeFFT",        # Col 63 <- Col 529: fBodyBodyGyroMag-mean()
                  "STD.BodyGyroscopeMagnitudeFFT",         # Col 64 <- Col 530: fBodyBodyGyroMag-std()
                  "Mean.BodyGyroscopeJerkMagnitudeFFT",    # Col 65 <- Col 542: fBodyBodyGyroJerkMag-mean()
                  "STD.BodyGyroscopeJerkMagnitudeFFT"      # Col 66 <- Col 543: fBodyBodyGyroJerkMag-std()
                  )

# Load Required Libraries
library(data.table)  # Used for faster data mutation

# Step 0: If reseting data delete existing data directory
if(resetData) {
    if(file.exists("./data")){
        unlink("./data", recursive = TRUE, force = TRUE)
    }
}

# Step 1: Download the data zip file
if(!file.exists("./data")) {
    dir.create("./data")
}
if(!file.exists("./data/Dataset.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./data/Dataset.zip", method = "curl")
    dateDownloaded <- date()
    cat("Files downloaded at:", dateDownloaded, "\n")
    cat(dateDownloaded, file = "./data/data_as_of.txt")
    cat("Files in ./data:", list.files("./data"), "\n")
}

# Step 2: Unzip the Dataset and Normalize the Feature Data
if(file.exists("./data") & !file.exists("./data/UCI HAR Dataset")) {
    unzip("./data/Dataset.zip", exdir = "./data")
    cat("Directories in ./data/UCI HAR Dataset:\n")
    print(list.dirs("./data/UCI Har Dataset"))
    
    # NOTE: This is a total hack because fread barfs on leading blanks in a record
    write.table(read.table("./data/UCI HAR Dataset/test/X_test.txt"),
                "./data/UCI HAR Dataset/test/feature_test.txt",
                row.names = FALSE, col.names = FALSE)
    write.table(read.table("./data/UCI HAR Dataset/train/X_train.txt"),
                "./data/UCI HAR Dataset/train/feature_train.txt",
                row.names = FALSE, col.names = FALSE)
}

# Step 3: Read in our data files into data tables (fast!)
dtFeatureTst <- fread("./data/UCI HAR Dataset/test/feature_test.txt",
                       select = featureCols)
dtSubjectTst <- fread("./data/UCI HAR Dataset/test/subject_test.txt")
dtActivityTst <- fread("./data/UCI HAR Dataset/test/y_test.txt")

dtFeatureTrn <- fread("./data/UCI HAR Dataset/train/feature_train.txt",
                      select = featureCols)
dtSubjectTrn <- fread("./data/UCI HAR Dataset/train/subject_train.txt")
dtActivityTrn <- fread("./data/UCI HAR Dataset/train/y_train.txt")
