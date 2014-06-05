# run_analysis.R - Create a tidy data set for smartphone usage
# Created and Submitted by Christopher Bortz
# For Getting and Cleaning Data, Dr. J, Section 004, June 2 - 30, 2014
# Course Peer-Assessed Project

# Step 1: Download the data zip file
if(!file.exists("./data")) {
    dir.create("./data")
}
if(!file.exists("./data/Dataset.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./data/Dataset.zip", method = "curl")
    dateDownloaded <- date()
    print(dateDownloaded)
}
print(list.files("./data"))

