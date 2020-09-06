############################################################################
#####  Solucion proyecto Getting and Cleaning Data Course Project      #####
############################################################################

# Initial Steps
  ##Load library
  library(dplyr)

  ##Set work directory
  setwd("E:/Personal/especializacion/ciencia de datos/curso3/semana4/proyecto_final/")


  # download zip file from website
  if(!file.exists("./dataProject")) dir.create("./dataProject")
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "./dataProject/projectData_getCleanData.zip")

  # unzip data
  listZip <- unzip("./dataProject/projectData_getCleanData.zip", exdir = "./dataProject")


# Reading the data

  # reading test data x
  test.x <- read.table("dataProject/UCI HAR Dataset/test/X_test.txt", header=FALSE)
  dim(test.x)

  # reading test activities
  test.y <- read.table("dataProject/UCI HAR Dataset/test/y_test.txt",  header=FALSE)

  # reading test subjects
  test.subject <- read.table("dataProject/UCI HAR Dataset/test/subject_test.txt"  , header = FALSE)
  dim(test.subject)

  # reading train data x
  train.x <- read.table("dataProject/UCI HAR Dataset/train/X_train.txt",  header=FALSE)

  # reading train  activities
  train.y <- read.table("dataProject/UCI HAR Dataset/train/y_train.txt",  header=FALSE)

  ## reading train  subjects
  train.subject <- read.table("dataProject/UCI HAR Dataset/train/subject_train.txt",  header=FALSE)
  dim(train.subject)

###########################################################
# 1  merges the training and the test sets
###########################################################

  data.x <- rbind(test.x, train.x)  #merge test
  dim(data.x)
  data.y <- rbind(test.y, train.y)  #merge activities
  dim(data.y)
  data.subject <- rbind( test.subject, train.subject) #merge subject
  dim(data.subject)
  View(x.data)
  dim(x.data)
  y.data <- rbind(y.test, y.train)
  View(y.data)
  dim(y.data)

  # cbind for subject, activities and data
  allData <- cbind( data.subject, data.y, data.x )
  dim( allData )
  View ( allData )



###########################################################
# 2 Extracts only the measurements on the mean and
#   standard deviation for each measurement.
###########################################################

  # get list of features
  features <- read.table("dataProject/UCI HAR Dataset/features.txt")[,2]
  features

  # get onl features with mean and desv
  featureIdWithMeanDesv <- grep(("mean\\(\\)|std\\(\\)"), features)
  featureIdWithMeanDesv
  finalAllData <- allData[, c(1, 2, featureIdWithMeanDesv+2)]
  finalAllData

  # Set colnames to finalAllData
  colnames(finalAllData) <- c("subject", "activity", features[featureIdWithMeanDesv])
  View(finalAllData)


###########################################################
# 3 Uses descriptive activity names to name the activities
#  in the data set.
###########################################################

  activities <- read.table(file.path("dataProject/UCI HAR Dataset/activity_labels.txt"))
  View(activities)
  finalAllData[, 2] <- activities[ finalAllData[,2], 2]



###########################################################
# 4 Appropriately labels the data set with descriptive
#  variable names..
###########################################################
#It seeks to obtain complete and easy-to-understand strings in field names
  names(finalAllData) <- gsub("\\()", "", names(finalAllData))
  names(finalAllData) <- gsub("^t", "time", names(finalAllData))
  names(finalAllData) <- gsub("^f", "frequence", names(finalAllData))
  names(finalAllData) <- gsub("-mean", "Mean", names(finalAllData))
  names(finalAllData) <- gsub("-std", "Std", names(finalAllData))
  View(finalAllData)

###########################################################
# 5 From the data set in step 4, creates a second,
#  independent tidy data set with the average of each
#  variable for each activity and each subject.
###########################################################

  groupBySubAct <- finalAllData %>%
    group_by(subject, activity) %>%
    summarise_all(mean)
  View(groupBySubAct)
  ##Save in text file MeanDataBySubjectActivity.txt with the average of each variable for each activity and each subject
  write.table(groupBySubAct, "dataProject/UCI HAR Dataset/MeanDataBySubjectActivity.txt", row.names = FALSE)
