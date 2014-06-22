#Samsung Data Analysis Codebook
##Scope of document
This document contains relevant description of the Cleaning phase of Samsung Data, necessary to further data analysis 
(i.e. modeling, etc.). The document reports on general variable description, any transformation operated on data, 
the structure of output of these transformation.
## Data input
The data is found on web and is presented as a zipp file. This file is downloaded (refer to run_analysis script)  and unzipped in a folder called "samsung/UCI...".
After the unzipping the folder presents the following strucure:
1. Samsung
1.1 UC....
1.1.1 General files applicable to all dataset
1.1.2 TRAIN folder containing subset of measurements related to TRAIN
1.1.2.1 
1.1.2.2
1.1.3 TEST folder containing subset of measurements relate to TEST
1.1.3.1
1.1.3.2

## Data Cleaning
## Data output 1

## Data transformation
The transformation is realized on Data output 1 by mean of merge procedure followed by cast (requires reshape2 library)

## Data output 2
The dataset produced from above step is then written on the working directory as a txt file.
