# Tidy Data
The TidyDataSetProject is the course peer assessed assignment for Dr. Jeff Leek's "Getting and Cleaning Data" course offered in the Coursera Data Scientist Specialization Track.
## Assignment Instructions
The data used in this assignment is taken from the [UCI Human Activity Recognition study][1]. We are to take the dataset stored in a zip file, run a data cleaning script that creates a tidy data file and upload the Tidy Data to the assignment page. Also this READ ME and a Code Book (together with the processing script) are to be uploaded to a repository in our Github account and a link to that account is to be provided on the assignment page.
### Data Input
The data to be downloaded and processed is at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
### What the Processing Script (`run_analysis.R`) is Supposed To Do:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### My Interpretation of the Instructions
1. There is only one output from this process -- the tidy data set listed in step 5.
2. Data from the ./test and ./train directories are to be used in creating an intermediate data set from X_test.txt (which contains the feature data), y_test.txt (The activity id) and subject_test.txt (the subject id). A similar set is to created from the respective files in the trainging set (X_train.txt, y_train.txt, subject_train.txt) and combined with th test data to create one data set from which to create our tidy data.
3. The feature columns to be extracted from X_test.txt and X_train.txt are those which are the output of mean() and std() functions (per instruction 2 above). I took this to mean that features that have -mean() and -std() in their names (and only those) are to be selected. There are 66 columns with those strings in their names. There are a few columns with "meanFreq"" in their name but it is not clear that they are the result of applying the mean() function to data so they were not chosen.
4. The activity names that I used came from activity_labels.txt file in the data set.
5. I chose to expand the feature names by pretty much mapping the abbreviation to the full name. For instance if the original name was "tBodyAccJerk-mean()-X" I expanded it to "mean.BodyAccelerationJerkTime.X" where the function name is placed up front, the sensor is expanded next with an "Time" or "Freq" appended to it depending on whether it is a time or frequency domain variable and if the sensor was split into axes then that was put at the end of the name. This leads to some fairly long column names but I think its really easy to tell what kind of summary from what sensor measure by time or frequency along what axis (if any) the measurement comes from. For info on the exact mapping of each feature see the [code book](CodeBook.md).
6. The final data set should only have one row for each unique combination of subject (there are 30) and activity (there are 6) where an average is taken of each of the 66 extracted feature variables. Together with the subject ID and a friendly label for the activity, that leaves 180 rows of data with 68 columns plus a header row with labels.

## How to Get a Tidy Data Set
Make sure you have installed the data.table, plyr and reshape2 packages.
```{r}
install.packages(c("data.table", "plyr", "reshape2"))
```
Run the run_analysis.R script
```{r}
source("run_analysis.R")
```

The script is a soup to nuts self contained script. It will create a data subdirectory if it doesn't exist, download the zip file, unzip the zip file, load and transform the data, and output a Tidy dataset in the data directory **./data/UCITidyData.txt**.
## How to Load my Tidy Data
The data set created by the script is a space delimited, quoted text file with headers in the first row. You can load this into your favorite spreadsheet program or you read.table() with the defaults to load it into R. Assuming that you left the data file in the default location after creating it with my script that would look like:
```{r}
tidyData <- read.table("./data/UCITidyData.txt", header = TRUE, stringsAsFactors = FALSE)
```
**Note:** You could also set stringsAsFactors = TRUE and use the activity as a factor. It will work either way.
[1]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones