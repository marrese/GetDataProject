GetDataProject
==============

Repo containing codes and decription documents on project assigned in coursera course: GetData
##1. Document Scope
This document contains an overview of the project put in the course "Getting and Cleaning Data" . It has bee compiled in june 2014. The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. T
he goal is to prepare tidy data that can be used for later analysis (not included in this project).
###2. General Reference
* Full description of source project is available at this url 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The data (in zipped format) is available t
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Along the course documentation on merging/casting and Tidy data, it is worth notice that some of the function utilized in this repo follow advices and description cited in this relevant document:
Tidy Data, Hadley Wickham  - (http://vita.had.co.nz/papers/tidy-data.pdf)

##3. Project Description
The project take the opportunity to investigate on wearable computing data. The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
The project consists in these two general high level goal:
*  reading data
*  cleaning and merging data
*  subsetting data according the outcome (this produce a fist tidy dataset)
*  Create some statistics (mean) on subsetted data (this produces a second tidy dataset)

##4. Content of the repository
###4.1 The readme file
This document file contains a general processing description of the work (see chapter 5)
###4.2 The Codebook
The Codebook goes in a mre deep detail,where some techinalities are explained in detail as the following:
* Variables decription
* Operations details
* transformation of work performed in each operation

###4.3 The run_analisys code
This file contain an R file developed by the author in order to get, maniputate and transform data. Using this file the reader can clean and trasform project data, and also genarate the requested 2 dataset automatically. The code contains comment each snippet of code (i.e. operating a bit of relevant work.

##5. General processing description
###5.1 Reading data and other assuptions on folder
The assigned data are zipped in a file. It is assumed that this zip file should be unzipped manually first in a working directory (C:/Users/Marrese/Desktop/RDatabase/CleanData/project/UCI HAR Dataset) called root directory. From this point the script may operate unmanned.

###5.2 Reading data into R
The file reading starts reading relevant file from the root directory:
* activity table - containing type of activity
* features - containing the type of variables observed
The real observations are divided in two folder (train and test) probably for subsequent modeling job.
For each folder the following files are extracted:
* X_file (contaning observations for each feature)
* Y_file
* Subject file (containing numeric value ID of subject performing the activity)

###5.3 Combining data
In combining data following steps are executed.
* concatenate X files (train/test) with subject file (train/test) and Y files (train/test)
* merge by row train and test dataset
At this point there is a unique dataset containing subject, activities and observation in one place (xtot). This is used in the subsequent phase.

###5.4 Clean & merge data
1. Since the project assignment requires only the use of tw type of observation, mean and std, the principal cleaning operation is to remove all useless variables (not mean, not std in their name).
2. A second operation has been made to rename the activities in a more descriptive manner
3. The same of above to appropriately label the data set with descriptive variable names

###5.5 Build the first Tidy dataset
After a column resort in order to get a more readable dataset, finally the firts tidy dataset has been created (TidyDF1).

###5.6 Build the second Tidy dataset
As requested, a second tidy dataset is generated from previous one by melting and casting function of reshape package. The first dataset if melted by activity and subject where measure variables are the observation, then the resulting dataframe is cast into a new independent dataset (TidyDF2) which contains the the average of each variable for each activity and each subject.

