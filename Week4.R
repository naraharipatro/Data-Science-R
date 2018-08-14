#Predictive modelling with caret

install.packages('caret')

#best package for predictive modelling
library('caret')

mtcars = mtcars

# Step 1: Select the required columns
myData = mtcars[,c("mpg","wt")]

# Step 2: Train your model. Use the model abbreviations at http://topepo.github.io/caret/available-models.html
model = train(mpg ~.,myData, method="lm")

# To display Beta 0 & Beta 1
model$finalModel

#Now find the linear regression model for predicting mpg from hp
myData2 = mtcars[,c("mpg","hp")]

model2 = train(mpg ~.,myData2, method="lm")

model2$finalModel

# Multiple linear model - predict using hp, wt & qsec
myData3 = mtcars[,c("mpg","hp","wt","qsec")]

model3 = train(mpg ~.,myData3, method="lm")

model3$finalModel

# prediction accuracy
predictedMpgs = predict(model3, myData3)
#see first 5 values
predictedMpgs[1:5] 

# compare predicted & actual values
as.numeric(predictedMpgs[1:5])
myData3$mpg[1:5]

# calculate MAE
mean(abs(predictedMpgs - myData3$mpg))

# calculate RMSE
RMSE(predictedMpgs,myData3$mpg)

#calculate R-squared
R2(predictedMpgs,myData3$mpg)

# SPlit data and train, test

# Step 1: Data split. Select random values by taking every alternate number
training = mtcars[seq(1,nrow(mtcars),2),c("mpg","hp","wt","qsec")]
testing = mtcars[seq(2,nrow(mtcars),2),c("mpg","hp","wt","qsec")]

# Step 2: Train the model using training set
model4 = train(mpg ~.,training,method="lm")

# Step3: Predict mpgs in testing dataset
predictedMpgs4 = predict(model4,testing)

# Step 4:Measure RMSE & R-square
RMSE(predictedMpgs4,testing$mpg)
R2(predictedMpgs4,testing$mpg)
