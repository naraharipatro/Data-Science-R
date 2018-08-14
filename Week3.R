library(ggplot2)

#box plot
ggplot(mpg, aes(class,hwy,fill=class)) + geom_boxplot()

#violin plot
ggplot(mpg, aes(class,hwy,fill=class)) + geom_violin() + theme_bw() + theme(text = element_text(size=20))

library(utils)

realEstate = read.csv("Sac.csv")

#count of unique cities
rUnCities = length(unique(realEstate$city))

#correlation between sqft & price
ggplot(realEstate, aes(x=sq__ft,y=price)) + geom_point(size=2,color="blue")
corrVal = cor(realEstate$sq__ft,realEstate$price)

#distribution of prices
ggplot(realEstate,aes(price))+geom_histogram(bins=20,color="pink", fill="blue") + 
  ggtitle("Distribution of prices") + theme_bw() +
  theme(text = element_text(size=15), plot.title = element_text(hjust=.5)) +
  xlab("Price") + ylab("")

#correlation between latitude & price
corrVal2 = cor(realEstate$latitude,realEstate$price)

#correlation between beds & baths
corrVal3 = cor(realEstate$beds,realEstate$baths)

#comparison between price ranges for various bed numbers
ggplot(realEstate,aes(beds,price,color=as.character(beds)))+geom_jitter()+theme_bw()
ggplot(realEstate,aes(beds,price,fill=as.character(beds)))+geom_boxplot()
#5 - has higher price. 4 bed has greater fluctuation in price

#rows with 1 bed
oneBedRows = which(realEstate$beds == 1)

#rows with sqft<1000 & beds>2
reqRows = which(realEstate$sq__ft < 1 & realEstate$beds >= 2)
