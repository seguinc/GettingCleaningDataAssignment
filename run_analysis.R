# We start by assuming that the Samsung data is in the working directory.
# We assume that the dplyr package has been installed.
# We save the training set and test set in data tables.
train<-tbl_df(read.table("./train/X_train.txt"))
test<-tbl_df(read.table("./test/X_test.txt"))

# 1 - Merge the training and the test sets to create one data set.
# The training and test data sets are respectively 70% and 30% of the observations that were collected. 
# They have the same number of columns but different numbers of rows.
# We use the rbind function to merge the training and the test sets to create one dataset.
MergedData<-rbind(test,train)


# 2 - Extract only the measurements  on the mean and standard deviation for each measurement
# We start by reading the list of all features in a data table.
features<-tbl_df(read.table("./features.txt"))
# We assign more descriptive column names to the features data table
names(features)<-c("featureIndex","featureName")
# We use the grep function to identify which features are measurements on the mean and standard deviation for each measurement. 
# We are assuming that this means extracting all measurements that have "mean()" or "std()" in their name.
ListMeasurements<-grep("std()|mean()",features$featureName)
# We extract the corresponding measurements in our MergedData data set.
MergedDataExtract<-MergedData[,ListMeasurements]

# 3 - Use descriptive activity names to name the activities in the data set.
# We start by reading the labels data sets and merging them such that they match the data set, and renaming the data with a more descriptive variable names.
trainActivity<-tbl_df(read.table("./train/y_train.txt"))
testActivity<-tbl_df(read.table("./test/y_test.txt"))
MergedActivity<-rbind(testActivity,trainActivity)
names(MergedActivity)<-c("activityIndex")
# We read the activity labels and assign more descriptive namesto the columns
activityLabels<-tbl_df(read.table("./activity_labels.txt"))
names(activityLabels)<-c("activityIndex","activityName")
# We use the left_join function to assign an activity name to each record
MergedActivity2<-left_join(MergedActivity,activityLabels)

# We use the cbind function to bring together the dataset and the activity names
MergedDataExtractActivity<-cbind(MergedActivity2$activityName,MergedDataExtract)

# 4 - Appropiately label the data set with desctiptive variable name
# We rename the data set using the feature names information.
names(MergedDataExtractActivity)<-c("activityName",as.character(features$featureName[ListMeasurements]))

# 5 - From data set in 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
# We start by reading the subject information and merging them such that they match the data set, and renaming the data with a more descriptive variable name.
trainSubject<-tbl_df(read.table("./train/subject_train.txt"))
testSubject<-tbl_df(read.table("./test/subject_test.txt"))
MergedSubject<-rbind(testSubject,trainSubject)
names(MergedSubject)<-c("subjectIndex")
MergedDataExtractActivitySubject<-cbind(MergedSubject,MergedDataExtractActivity)

# We group the data by subject and by activity.
groupedData<-group_by(MergedDataExtractActivitySubject,subjectIndex,activityName)
# We take the average of each column, for each subject and each activity.
summaryData<-summarise_each(groupedData,funs(mean))
names(summaryData)<-names(MergedDataExtractActivitySubject)

# We write the results to a txt file created with write.table() using row.name=FALSE.
write.table(summaryData, "./summaryData.txt",row.names=FALSE)

# We believe that the resulting dataset is tidy, since each variable forms a column, each observation forms a row, and there is only one type of observational unit.

