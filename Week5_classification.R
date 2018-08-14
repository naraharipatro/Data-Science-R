
# classification example - classify flower

library(caret)

#nearest neighbor classification
iris = iris

#Step 1: split the train and testing data
training = iris[seq(1,nrow(iris),2),c(1,3,5)]
testing = iris[seq(2,nrow(iris),2),c(1,3,5)]

#Step 2 : train the model
model = train(Species ~., training,method="kknn")


#Step 3 : test the model
predictedSpecies = predict(model,testing)

#Step 4: measure the accuracy. (count the sum of true and divide by the total count to get the accuracy percentage.
#True is considered as 1 and false as o
sum(predictedSpecies == testing$Species)/nrow(testing)
