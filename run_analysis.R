# run_analysis.R - Create a tidy data set for smartphone usage
# Created and Submitted by Christopher Bortz
# For Getting and Cleaning Data, Dr. J, Section 004, June 2 - 30, 2014
# Course Peer-Assessed Project

# Setup some global configuration variables
resetData <- FALSE  # If this is set to true, remove the data directory and start fresh
featureCols <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 
                 214:215, 227:228, 240:241, 253:254, 266:271, 345:350,
                 424:429, 503:504, 516:517, 529:530, 542:543)


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
dtFeatureTest <- fread("./data/UCI HAR Dataset/test/feature_test.txt",
                       select = featureCols)
