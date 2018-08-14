realEstate = read.csv("Sac.csv")

# SPlit data and train, test

# Step 1: Data split. Select random values by taking every alternate number
training = realEstate[seq(1,nrow(realEstate),2),c("beds","baths","sq__ft","price")]
testing = realEstate[seq(2,nrow(realEstate),2),c("beds","baths","sq__ft","price")]

# Step 2: Train the model using training set
model = train(price ~.,training,method="lm")

# Step3: Predict mpgs in testing dataset
predictedPrices = predict(model,testing)

# Step 4:Measure RMSE & R-square
RMSE(predictedPrices,testing$price)
R2(predictedPrices,testing$price)

as.numeric(predictedPrices[1:5])
testing$price[1:5]
