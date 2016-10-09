# GettingCleaningDataAssignment
Repository to save the deliverables of the final assignment, as part of the Getting and Cleaning the data course.
========================================================================================================================
The dataset includes the following files:
=======================================================================================================================

- 'ReadMe.txt’

- ‘CodeBook.txt’: explains the variable names and definitions in the data set submitted for the last part of the assignment, as well as the transformations that were done on the original data.

- ‘Run_analysis.R’: Script that runs as long as the Samsung data is in the user’s working directory.

The marker can use the following code in R to view the data that the script has produced:
checkData <- read.table("./summaryData.txt", header = TRUE)
