GetDataProject
==============

Repo containing codes and decription documents on project assigned in coursera course: GetData
##1. Document Scope
This document contains an overview of the project put in the course "Getting and Cleaning Data" . It has bee compiled in june 2014. The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. T
he goal is to prepare tidy data that can be used for later analysis (not included in this project).
###2. General Reference
put the relevant documentation
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

###5.4 Clean & merge data

###5.5 Build the first Tidy dataset

###5.6 Build the second Tidy dataset


