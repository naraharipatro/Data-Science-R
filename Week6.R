#Evluate models using bootstrap

library(caret)

# Step1: Prepare your dataset: removed last 2 columns as they are irrelevant for our calculation
air = airquality[1:4]
air=air[complete.cases(air),]

# Step2: Setup train control parameter
train_control = trainControl(method="boot", number=50)

# Step 3: Train the model
m1 = train(Ozone~., data=air, trControl=train_control, method="rf")
m2 = train(Ozone~., data=air, trControl=train_control, method="lm")
m3 = train(Ozone~., data=air, trControl=train_control, method="brnn")

#Error in na.fail.default(list(Ozone = c(41L, 36L, 12L, 18L, NA, 28L, 23L,  : missing values in object
#Above error occcurs because there are NAs in code. Added complete.cases to remove those NAs

# Step 4: Compare the models
# compare the RMSE & RSquares of all models using box plot

allModels = resamples(list(RandomForest=m1,Linear=m2,NeuralNet=m3))
bwplot(allModels,scales=list(relation="free"))  #scale uses diff scale for each plot

#If error is - margins are too low or high, increase the size of plot area by dragging the margins 

############################ K- fold CV ################################

# Step2: Setup train control parameter
train_control2 = trainControl(method="cv", number=5)

# Step 3: Train the model
m4 = train(Ozone~., data=air, trControl=train_control2, method="rf")
m5 = train(Ozone~., data=air, trControl=train_control2, method="lm")
m6 = train(Ozone~., data=air, trControl=train_control2, method="brnn")

#Error in na.fail.default(list(Ozone = c(41L, 36L, 12L, 18L, NA, 28L, 23L,  : missing values in object
#Above error occcurs because there are NAs in code. Added complete.cases to remove those NAs

# Step 4: Compare the models
# compare the RMSE & RSquares of all models using box plot

allModels2 = resamples(list(RandomForest=m4,Linear=m5,NeuralNet=m6))
bwplot(allModels2,scales=list(relation="free"))  #scale uses diff scale for each plot

#If error is - margins are too low or high, increase the size of plot area by dragging the margins 

############################ repeated K- fold CV ################################

# Step2: Setup train control parameter
train_control3 = trainControl(method="repeatedcv", number=5,repeats=3)

# Step 3: Train the model
m7 = train(Ozone~., data=air, trControl=train_control3, method="rf")
m8 = train(Ozone~., data=air, trControl=train_control3, method="lm")
m9 = train(Ozone~., data=air, trControl=train_control3, method="brnn")

#Error in na.fail.default(list(Ozone = c(41L, 36L, 12L, 18L, NA, 28L, 23L,  : missing values in object
#Above error occcurs because there are NAs in code. Added complete.cases to remove those NAs

# Step 4: Compare the models
# compare the RMSE & RSquares of all models using box plot

allModels3 = resamples(list(RandomForest=m7,Linear=m8,NeuralNet=m9))
bwplot(allModels3,scales=list(relation="free"))  #scale uses diff scale for each plot

#If error is - margins are too low or high, increase the size of plot area by dragging the margins 


################################ Clustering k-means ###################################

# k-means clustering

library(stats)
iris=iris
clusters = kmeans(iris[,c(1,3)], 3)
clusters$cluster

#use ggplot to plot petal.length & sepal.length and use the clusters to color them and see how they look
ggplot(iris,aes(Sepal.Length, Petal.Length, color=as.character(clusters$cluster))) + geom_point(size=4) + theme_bw() 
       
# to add a col to iris dataset
iris$clusters = clusters$cluster

       