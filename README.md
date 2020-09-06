# run_analysis.R
## Solucion proyecto Getting and Cleaning Data Course Project

Contains initial steps in which we perform the following actions

  Load library **dplyr**

  fix work environment

  download file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

  unzip in  **dataProject**

## Reading data

  I read the test data in variables **test.x** , **test.y**,  **test.subject**
  I read the train data in variabless **train.x**, **train.y** , **train.subject**
  
  
## merges the training and the test sets 

  I generate variable **allData** with all data **subject**,  **test** , **entrenamiento** 
 
## Extracts only the measurements on the **mean** and **standard deviation** for each measurement. 

  I read file  **features.txt** to get list of features
  
  get only features with mean and desv  only
  
  I create the variable **finalAllData** with only mean and desv features
  
  I update column names with these features
  
## Uses descriptive activity names to name the activities
  
  I read file  **activity_labels.txt**
  
  I update activity names with the names of **achivo activity_labels**

## Appropriately labels the data set with descriptive
  
  It seeks to obtain complete and easy-to-understand strings in field names

## I create a file tidy with  the average of each variable for each activity and each subject.    

  I create the file **MeanDataBySubjectActivity.txt**
  
  
  
  
  
  

  
  
  
