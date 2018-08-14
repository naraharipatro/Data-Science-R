#load caret
library(caret)

#read file
setwd("./R scripts/spambase")
spambase = read.csv("spambase.csv")

# Step 1: shuffle the array and split into training and testing sets
spambase2 = spambase[sample(nrow(spambase)/2),]
training = spambase2[seq(1,nrow(spambase2),2),]
testing = spambase2[seq(2,nrow(spambase2),2),]


# ********** try with random forest *****************

# Step 2: Train the model
# train(x,y,model)
model2 = train( spambase2[,-58], as.character(spambase2[,58]), method="cforest" )

#test the model
predictedSpams2 = predict(model2,testing)

#calculate accuracy
sum(predictedSpams2 == testing[,58])/nrow(testing)

#Got accuracy as 0.9730435