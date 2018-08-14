#load caret
library(ggplot2)
library(caret)

#read file
setwd("./R scripts/noshowappointments")
noshowdata = read.csv("KaggleV2-May-2016.csv")

#add a noshow column to specify 1 where there is a no-show, else 0
noshowdata$noshow = ifelse(noshowdata$No.show == "Yes",1,0)

# select required columns
noshowdataReq = noshowdata[,c(3,6,7,8,9,10,11,12,13,15)]

# One hot encoding to handle categorical data
noshowdataOHE = dummyVars(" ~ .", data = noshowdataReq)
noshowdataNew = data.frame(predict(noshowdataOHE, newdata = noshowdataReq))

# Step 1: shuffle the array and split into training and testing sets
noshowdatashuff = noshowdataNew[sample(nrow(noshowdataNew)),]

# Replace no show numerical column with actual categorical data
noshowdatashuff$noshow = ifelse(noshowdatashuff$noshow == 1,"Yes","No")

#reduce data size
noshowdata2 = noshowdatashuff[seq(1,nrow(noshowdatashuff),5),]

training = noshowdata2[seq(1,nrow(noshowdata2),2),]
testing = noshowdata2[seq(2,nrow(noshowdata2),2),]


# Step 2: Train the model
# didn't work - model = train(as.character(training[,c(58)]) ~., training,method="kknn")
# train(x,y,model)
#model = train( noshowdata2[,-c(14,15)], as.character(noshowdata2[,15]), method="kknn" )

model = train(noshow ~., training, method="kknn")

#test the model
predictednoshows = predict(model,testing)

sum(predictednoshows == testing$noshow)/nrow(testing)
