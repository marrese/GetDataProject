#Samsung Data Analysis Codebook
##Scope of document
This document contains relevant description of the Cleaning phase of Samsung Data, necessary to further data analysis 
(i.e. modeling, etc.). The document reports on general variable description, any transformation operated on data, 
the structure of output of these transformation.
## Data input
The data is found on web and is presented as a zipp file. This file is downloaded (refer to run_analysis script)  and unzipped in a folder called "samsung/UCI...".
After the unzipping the folder presents the following strucure:

1. Samsung

1.1 UCI HAR Dataset

1.1.1  General files applicable to all dataset (Avtivity_label, Features)

1.1.2 TRAIN folder containing subset of measurements related to TRAIN (measurement, Features, Subject)

1.1.3 TEST folder containing subset of measurements relate to TEST (measurement, features, subject)

## Data Cleaning
The resulting dataset are thet massaged in the following way:
1. The dataset TRAIN and TEST are concatenated by row (the resulting dataset is called "xtot")

2. Since the assignement requires only the use of mean and std variable, the xtot dataset is then reduced to that variables (by mean of grep function which scans on the label names reporting the result in a logical way.

3. The real Activity name are the inserted in the xtot dataset (function merge)

4. In order to get a more readable var description, these are the renamed in a more descriptive fashion (use of gsub function)


## Data output 1
The resulting dataset is a tidy dataset strucured in the following way.
The column contains Activity,Subject, Measurement (79 item)

## Data transformation
The transformation is realized on Data output 1 by mean of merge procedure followed by cast (requires reshape2 library)
The resulting dataset contains all the measure average (column) grouped by activity and subject.

## Data output 2
The dataset produced from above step is then written on the working directory as a txt file.
