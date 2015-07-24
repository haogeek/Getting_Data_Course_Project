library(plyr)

activityTrain <- read.table("./UCI\ HAR\ Dataset/train/y_train.txt")
activityTest <- read.table("./UCI\ HAR\ Dataset/test/y_test.txt")
subjectTrain<- read.table("./UCI\ HAR\ Dataset/train/subject_train.txt")
subjectTest <- read.table("./UCI\ HAR\ Dataset/test/subject_test.txt")
featuresTrain <- read.table("./UCI\ HAR\ Dataset/train/x_train.txt")
featuresTest <- read.table("./UCI\ HAR\ Dataset/test/x_test.txt")
featureNames <- read.table("./UCI\ HAR\ Dataset/features.txt")
activityLabels <- read.table("./UCI\ HAR\ Dataset/activity_labels.txt")

activity <- rbind(activityTrain,activityTest)
subject <- rbind(subjectTrain,subjectTest)
features <- rbind(featuresTrain,featuresTest)

names(activity) <- c("activity")
names(subject) <- c("subject")
names(features) <- featureNames$V2

totalData <- cbind(activity,subject)
totalData <- cbind(totalData,features)

subFeatures <- featureNames$V2[grep("mean\\(\\)|std\\(\\)", featureNames$V2)]
selectColumns <- c(as.character(subFeatures),"subject","activity")
selectData <- subset(totalData,select = selectColumns)

for(i in 1:nrow(selectData)){
  selectData[i,ncol(selectData)] <- as.character(activityLabels[as.numeric(selectData[i,ncol(selectData)]),2])
}

colNames <- colnames(selectData)

for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("([Aa]cc)","Accelerometer",colNames[i])
  colNames[i] = gsub("([Mm]ag)","Magnitude",colNames[i])
  colNames[i] = gsub("(jerk)","Jerk",colNames[i])
}

colnames(selectData) <- colNames

tidyData <- ddply(selectData, .(subject,activity), function(x) colMeans(x[,1:66]))
write.table(tidyData, "tidydata.txt", row.name=FALSE)