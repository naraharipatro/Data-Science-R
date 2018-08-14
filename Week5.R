library(utils)
library(caret)

#import csv file
realEstate = read.csv("Sac.csv")

#clean data (remove outliers - entries with 0 sqft)
newRealEstate = realEstate[-which(realEstate$sq__ft == 0),]

# 1: create train & test data
training = newRealEstate[seq(1,nrow(newRealEstate),2),
                         c("price","sq__ft","beds","baths")]

testing = newRealEstate[seq(2,nrow(newRealEstate),2),
                         c("price","sq__ft","beds","baths")]

# 2: training
model = train(price ~.,training,method="lm")

# 3: test the model..(no need to remove price col from test data. algorithm ignores it)
predictedPrices = predict(model,testing)

# 4: Measure RMSE
RMSE(testing$price, predictedPrices)

# for greedy feature selection, do the above analysis with 1 feature. Then add other features 1 by one and see which 
# feature decreases or increases RMSE. If RMSE decreases, keep the new feature. Else remove that and move on.
