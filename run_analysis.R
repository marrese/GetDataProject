##########################
#   run.analysis.R script
##########################
#
# Mail functionalities
#
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#
#
#
# 0. Reading datasets
#
# 
#install required packages
install.packages("reshape2")
library("reshape2")

#setting working directory
setwd("C:/Users/Marrese/Desktop/RDatabase/CleanData/project/UCI HAR Dataset")
install.packages("reshape2")
library("reshape2")


#read activity table
dir=getwd()
filename="activity_labels.txt"
activity_labels <- read.table(paste(dir,"/",filename,sep=""), quote="\"")
#
# read features (col names)
filename="features.txt"
features <- read.table(paste(dir,"/",filename,sep=""), quote="\"")

#read 3 datasets from train folder
dir=paste(getwd(),"/train",sep="")
filename="X_train.txt"
X_train <- read.table(paste(dir,"/",filename,sep=""), quote="\"")
filename="subject_train.txt"
subject_train <- read.table(paste(dir,"/",filename,sep=""), quote="\"")
filename="Y_train.txt"
Y_train <- read.table(paste(dir,"/",filename,sep=""), quote="\"")

#read 3 dataset from test folder
dir=paste(getwd(),"/test",sep="")
filename="X_test.txt"
X_test <- read.table(paste(dir,"/",filename,sep=""), quote="\"")
filename="subject_test.txt"
subject_test <- read.table(paste(dir,"/",filename,sep=""), quote="\"")
filename="Y_test.txt"
Y_test <- read.table(paste(dir,"/",filename,sep=""), quote="\"")

#look if everything is OK
head(str(X_train))
tail(str(X_train))
head(str(X_test))

#concatenate X files (train/test) with subject file (train/test)
x_train=cbind(subject_train,Y_train,X_train)
x_test=cbind(subject_test,Y_test,X_test)

#subsetting data for a faster test job (to be removed in final version)
#xtrain=x_train[1:70,]
#xtest=x_test[1:30,]
xtest=x_train
xtrain=x_train
# remove useless DF
rm(x_train,x_test,X_test,X_train)

#############  1. Merge by row the training and the test sets to create one data set.
# simulate work in handiest dimension
# merge subsetted data by row
xtot=rbind(xtrain,xtest) #xtot contains 100 obs per 561+1+1 cols

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

#naming colums of xtot
names=as.character(features[,2])

# table(dummy) #there should be 79 TRUE entry
namestot=c("SubjectID","ActivityID",names)

#rename xtot labels
names(xtot)=namestot

#subsetting dataframe
#
#create a logical array containing TRUE where are mean()or std() string
validvars=grepl("mean()|std()",names) 
xtot=xtot[,validvars]


#remove useless datafarmes
#TBD

# 3. Uses descriptive activity names to name the activities in the data set
names(activity_labels)=c("ActivityID","ActivityName")
TidyDF1=merge(xtot,activity_labels, by="ActivityID")
#resort columns
newsort=c(2,82,3:81)
TidyDF1=TidyDF1[,newsort] #subset & resort xlarge DF eliminating also ActivityID
#
#

############## 4. Appropriately labels the data set with descriptive variable names.
#
ff=names(TidyDF1)
pat="Acc";rep="_Acceleration"
ff=gsub(pat,rep,ff)

pat="Gravity"
rep="_Gravity"
ff=gsub(pat,rep,ff)

pat="Gyro"
rep="_Gyroscope"
ff=gsub(pat,rep,ff)

pat="Jerk"
rep="_JerkSignal"
ff=gsub(pat,rep,ff)

pat="Mag"
rep="_Magnitude"
ff=gsub(pat,rep,ff)

pat="\\(\\)"
rep=""
ff=gsub(pat,rep,ff)

pat="t"
rep="TimeDomain_"
ff=sub(pat,rep,ff)

pat="f"
rep="FrequencyDomain_"
ff=sub(pat,rep,ff)

names(TdyDF1)=ff
#
#
################# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
IDgroup=names(TidyDF1)[1:2]
MeasureGroup=names(TidyDF1)[3:81]
longData=melt(TidyDF1,id=IDgroup,measure.vars=MeasureGroup)
TidyDF2=dcast(longData,ActivityName+SubjectID ~ variable, mean)
