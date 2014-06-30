# run_analysis.R - Create a tidy data set for smartphone usage
# Created and Submitted by Christopher Bortz
# For Getting and Cleaning Data, Dr. J, Section 004, June 2 - 30, 2014
# Course Peer-Assessed Project

# Load Required Libraries
library(data.table)  # Used for faster data mutation
library(reshape2) # Used to reshape the data into a set of means by subject and activity

# Setup some global configuration variables
resetData <- FALSE  # If this is set to true, remove the data directory and start fresh
debugScript <- FALSE # Set this to true to retain intermediate data tables otherwise they are removed

# Setup the Feature Columns that we want and user friendly (sort of) names for them
featureCols <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 
                 214:215, 227:228, 240:241, 253:254, 266:271, 345:350,
                 424:429, 503:504, 516:517, 529:530, 542:543)
featureNames <- c("Mean.BodyAccelerationTime.X",             # Col  1 <- Col   1: tBodyAcc-mean()-X
                  "Mean.BodyAccelerationTime.Y",             # Col  2 <- Col   2: tBodyAcc-mean()-Y
                  "Mean.BodyAccelerationTime.Z",             # Col  3 <- Col   3: tBodyAcc-mean()-Z
                  "STD.BodyAccelerationTime.X",              # Col  4 <- Col   4: tBodyAcc-std()-X
                  "STD.BodyAccelerationTime.Y",              # Col  5 <- Col   5: tBodyAcc-std()-Y
                  "STD.BodyAccelerationTime.Z",              # Col  6 <- Col   6: tBodyAcc-std()-Z
                  "Mean.GravityAccelerationTime.X",          # Col  7 <- Col  41: tGravityAcc-mean()-X
                  "Mean.GravityAccelerationTime.Y",          # Col  8 <- Col  42: tGravityAcc-mean()-Y
                  "Mean.GravityAccelerationTime.Z",          # Col  9 <- Col  43: tGravityAcc-mean()-Z
                  "STD.GravityAccelerationTime.X",           # Col 10 <- Col  44: tGravityAcc-std()-X
                  "STD.GravityAccelerationTime.Y",           # Col 11 <- Col  45: tGravityAcc-std()-Y
                  "STD.GravityAccelerationTime.Z",           # Col 12 <- col  46: tGravityAcc-std()-Z
                  "Mean.BodyAccelerationJerkTime.X",         # Col 13 <- Col  81: tBodyAccJerk-mean()-X
                  "Mean.BodyAccelerationJerkTime.Y",         # Col 14 <- Col  82: tBodyAccJerk-mean()-Y
                  "Mean.BodyAccelerationJerkTime.Z",         # Col 15 <- Col  83: tBodyAccJerk-mean()-Z
                  "STD.BodyAccelerationJerkTime.X",          # Col 16 <- Col  84: tBodyAccJerk-std()-X
                  "STD.BodyAccelerationJerkTime.Y",          # Col 17 <- Col  85: tBodyAccJerk-std()-Y
                  "STD.BodyAccelerationJerkTime.Z",          # Col 18 <- Col  86: tBodyAccJerk-std()-Z
                  "Mean.BodyGyroscopeTime.X",                # Col 19 <- Col 121: tBodyGyro-mean()-X
                  "Mean.BodyGyroscopeTime.Y",                # Col 20 <- Col 122: tBodyGyro-mean()-Y
                  "Mean.BodyGyroscopeTime.Z",                # Col 21 <- Col 123: tBodyGyro-mean()-Z
                  "STD.BodyGyroscopeTime.X",                 # Col 22 <- Col 124: tBodyGyro-std()-X
                  "STD.BodyGyroscopeTime.Y",                 # Col 23 <- Col 125: tBodyGyro-std()-Y
                  "STD.BodyGyroscopeTime.Z",                 # Col 24 <- Col 126: tBodyGyro-std()-Z
                  "Mean.BodyGyroscopeJerkTime.X",            # Col 25 <- Col 161: tBodyGyroJerk-mean()-X
                  "Mean.BodyGyroscopeJerkTime.Y",            # Col 26 <- Col 162: tBodyGyroJerk-mean()-Y
                  "Mean.BodyGyroscopeJerkTime.Z",            # Col 27 <- Col 163: tBodyGyroJerk-mean()-Z
                  "STD.BodyGyroscopeJerkTime.X",             # Col 28 <- Col 164: tBodyGyroJerk-std()-X
                  "STD.BodyGyroscopeJerkTime.Y",             # Col 29 <- Col 165: tBodyGyroJerk-std()-Y
                  "STD.BodyGyroscopeJerkTime.Z",             # Col 30 <- Col 166: tBodyGyroJerk-std()-Z
                  "Mean.BodyAccelerationMagnitudeTime",      # Col 31 <- Col 201: tBodyAccMag-mean()
                  "STD.BodyAccelerationMagnitudeTime",       # Col 32 <- Col 202: tBodyAccMag-std()
                  "Mean.GravityAccelerationMagnitudeTime",   # Col 33 <- Col 214: tGravityAccMag-mean()
                  "STD.GravityAccelerationMagnitudeTime",    # Col 34 <- Col 215: tGravityAccMag-std()
                  "Mean.BodyAccelerationJerkMagnitudeTime",  # Col 35 <- Col 227: tBodyAccJerkMag-mean()
                  "STD.BodyAccelerationJerkMagnitudeTime",   # Col 36 <- Col 228: tBodyAccJerkMag-std()
                  "Mean.BodyGyroscopeMagnitudeTime",         # Col 37 <- Col 240: tBodyGyroMag-mean()
                  "STD.BodyGyroscopeMagnitudeTime",          # Col 38 <- Col 241: tBodyGyroMag-std()
                  "Mean.BodyGyroscopeJerkMagnitudeTime",     # Col 39 <- Col 253: tBodyGyroJerkMag-mean()
                  "STD.BodyGyroscopeJerkMagnitudeTime",      # Col 40 <- Col 254: tBodyGyroJerkMag-std()
                  "Mean.BodyAccelerationFreq.X",            # Col 41 <- Col 266: fBodyAcc-mean()-X
                  "Mean.BodyAccelerationFreq.Y",            # Col 42 <- Col 267: fBodyAcc-mean()-Y
                  "Mean.BodyAccelerationFreq.Z",            # Col 43 <- Col 268: fBodyAcc-mean()-Z
                  "STD.BodyAccelerationFreq.X",             # Col 44 <- Col 269: fBodyAcc-std()-X
                  "STD.BodyAccelerationFreq.Y",             # Col 45 <- Col 270: fBodyAcc-std()-Y
                  "STD.BodyAccelerationFreq.Z",             # Col 46 <- Col 271: fBodyAcc-std()-Z
                  "Mean.BodyAccelerationJerkFreq.X",        # Col 47 <- Col 345: fBodyAccJerk-mean()-X
                  "Mean.BodyAccelerationJerkFreq.Y",        # Col 48 <- Col 346: fBodyAccJerk-mean()-Y
                  "Mean.BodyAccelerationJerkFreq.Z",        # Col 49 <- Col 347: fBodyAccJerk-mean()-Z
                  "STD.BodyAccelerationJerkFreq.X",         # Col 50 <- Col 348: fBodyAccJerk-std()-X
                  "STD.BodyAccelerationJerkFreq.Y",         # Col 51 <- Col 349: fBodyAccJerk-std()-Y
                  "STD.BodyAccelerationJerkFreq.Z",         # Col 52 <- Col 350: fBodyAccJerk-std()-Z
                  "Mean.BodyGyroscopeFreq.X",               # Col 53 <- Col 424: fBodyGyro-mean()-X
                  "Mean.BodyGyroscopeFreq.Y",               # Col 54 <- Col 425: fBodyGyro-mean()-Y
                  "Mean.BodyGyroscopeFreq.Z",               # Col 55 <- Col 426: fBodyGyro-mean()-Z
                  "STD.BodyGyroscopeFreq.X",                # Col 56 <- Col 427: fBodyGyro-std()-X
                  "STD.BodyGyroscopeFreq.Y",                # Col 57 <- Col 428: fBodyGyro-std()-Y
                  "STD.BodyGyroscopeFreq.Z",                # Col 58 <- Col 429: fBodyGyro-std()-Z
                  "Mean.BodyAccelerationMagnitudeFreq",     # Col 59 <- Col 503: fBodyAccMag-mean()
                  "STD.BodyAccelerationMagnitudeFreq",      # Col 60 <- Col 504: fBodyAccMag-std()
                  "Mean.BodyAccelerationJerkMagnitudeFreq", # Col 61 <- Col 516: fBodyBodyAccJerkMag-mean()
                  "STD.BodyAccelerationJerkMagnitudeFreq",  # Col 62 <- Col 517: fBodyBodyAccJerkMag-std()
                  "Mean.BodyGyroscopeMagnitudeFreq",        # Col 63 <- Col 529: fBodyBodyGyroMag-mean()
                  "STD.BodyGyroscopeMagnitudeFreq",         # Col 64 <- Col 530: fBodyBodyGyroMag-std()
                  "Mean.BodyGyroscopeJerkMagnitudeFreq",    # Col 65 <- Col 542: fBodyBodyGyroJerkMag-mean()
                  "STD.BodyGyroscopeJerkMagnitudeFreq"      # Col 66 <- Col 543: fBodyBodyGyroJerkMag-std()
                  )

# Setup Friendly Activity Names
activityNames <- c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying")

# Step 0: If reseting data delete existing data directory
if(resetData) {
    if(file.exists("./data")){
        unlink("./data", recursive = TRUE, force = TRUE)
    }
    cat("Data erased.\n")
}

# Step 1: Download the data zip file
if(!file.exists("./data")) {
    dir.create("./data")
    cat("Data directory(./data) created.\n")
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
    cat("Unzipping files...\n")
    unzip("./data/Dataset.zip", exdir = "./data")
    cat("Directories in ./data/UCI HAR Dataset:\n")
    print(list.dirs("./data/UCI Har Dataset"))
    
    # NOTE: This is a total hack because fread barfs on leading blanks in a record
    cat("Fixing up feature data sets for use with fread()...\n")
    write.table(read.table("./data/UCI HAR Dataset/test/X_test.txt"),
                "./data/UCI HAR Dataset/test/feature_test.txt",
                row.names = FALSE, col.names = FALSE)
    write.table(read.table("./data/UCI HAR Dataset/train/X_train.txt"),
                "./data/UCI HAR Dataset/train/feature_train.txt",
                row.names = FALSE, col.names = FALSE)
    cat("feature_test.txt and feature_train.txt created.\n")
}

# Step 3: Read in our data files into data tables (fast!)
cat("Loading data into data.tables...\n")
dtFeatureTst <- fread("./data/UCI HAR Dataset/test/feature_test.txt",
                       select = featureCols)
dtSubjectTst <- fread("./data/UCI HAR Dataset/test/subject_test.txt")
dtActivityTst <- fread("./data/UCI HAR Dataset/test/y_test.txt")

dtFeatureTrn <- fread("./data/UCI HAR Dataset/train/feature_train.txt",
                      select = featureCols)
dtSubjectTrn <- fread("./data/UCI HAR Dataset/train/subject_train.txt")
dtActivityTrn <- fread("./data/UCI HAR Dataset/train/y_train.txt")

# Step 4: Add Column Names to data table columns (setnames is fast with no copy of data table)
cat("Labelling data...\n")
setnames(dtFeatureTst, featureNames)
setnames(dtSubjectTst, "Subject.ID")
setnames(dtActivityTst, "Activity.ID")
setnames(dtFeatureTrn, featureNames)
setnames(dtSubjectTrn, "Subject.ID")
setnames(dtActivityTrn, "Activity.ID")

# Step 5: Add a factor with friendly names to the Activity data table
dtActivityTst[,Activity:=factor(Activity.ID, labels = activityNames)]
dtActivityTrn[,Activity:=factor(Activity.ID, labels = activityNames)]

# Step 6: Join the Test data tables together and the Traning Tables together
cat("Merging data...\n")
dtTest <- cbind(dtSubjectTst, dtActivityTst, dtFeatureTst)
dtTrain <- cbind(dtSubjectTrn, dtActivityTrn, dtFeatureTrn)

# Step 7: Combine the Test Data and the Training Data
dtData <- rbindlist(list(dtTrain,dtTest))

# Step 8: Set Key for Optimal Sorting and subsetting
setkey(dtData, Subject.ID, Activity)
dtData[ , Activity.ID := NULL]  # We no longer need this column

# Step 9: Create our Tidy Data Set from our big data table
cat("Summarizing data...\n")
dtMelt <- melt(dtData, id = c("Subject.ID", "Activity"))
tidyData <- dcast(dtMelt, Subject.ID + Activity ~ variable, mean)

# Step 10: Write out Our Tidy Data Set
cat("Writing Tidy Data set to ./data/UCITidyData.txt...\n")
write.table(tidyData, "./data/UCITidyData.txt", row.names = FALSE)

# Step 11: Clean up - Remove Intermediate data tables
if(!debugScript) {
    rm(dtActivityTrn, dtSubjectTrn, dtFeatureTrn,
       dtActivityTst, dtSubjectTst, dtFeatureTst,
       dtTest, dtTrain, dtMelt)
    cat("Intermediate results culled.\n")
}

cat("Done.\n")
