# Codebook

This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

## variables used

  **test.x**: test data  of file imported X_test.txt
  
  **test.y**: test activities data  of file imported y_test.txt
  
  **test.subject**: subject of studio generated  from  subject_test.txt
  
  **train.x**: train data  of file imported X_train.txt
  
  **train.y**: train activities data  of file imported y_train.txt
  
  **train.subject**: train of studio generated  from  subject_train.txt
  
  **data.x** : rbind of test.x and train.x
  
  **data.y** : rbind of train.x and train.y
  
  **data.subject**: rbind of test.subject and train.subject
  
  **allData**: cbind of data.subject, data.y, data.x 
  
  **features**: features of file imported features.txt
  
  **featureIdWithMeanDesv** : subset of features only mean and std
  
  **finalAllData**: data from alldata only with mean and std features
  
  **groupBySubAct**:  tidy data set with the average of each  variable for each activity and each subject
  
