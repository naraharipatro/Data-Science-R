library(ggplot2)

mtcars = mtcars

colnames(mtcars)

#histogram
ggplot(mtcars,aes(x=mpg)) + geom_histogram(binwidth=3,color="red",fill="green") + ggtitle("distribution of mpg") +
  ylab("number") + xlab("miles per gallon")+xlim(0,50)

#density plot
ggplot(mtcars,aes(x=mpg)) + geom_density(color="red",fill="green") + ggtitle("distribution of mpg") +
  ylab("number") + xlab("miles per gallon")+xlim(0,50)

#bar
ggplot(mtcars, aes(mpg)) + geom_bar(fill="green")

#scatter - as.character gives separate colors as discrete values. without that it will treat it as continous values
ggplot(mtcars, aes(x=wt,y=mpg,color=as.character(cyl))) + geom_point(size=3)

#boxplot
ggplot(mtcars, aes(x=as.character(cyl),y=mpg,fill=as.character(cyl))) + geom_boxplot() + xlab("no of cylinders") +
  ggtitle("box plot for mpgs")

#violin plot
#boxplot
ggplot(mtcars, aes(x=as.character(cyl),y=mpg,fill=as.character(cyl))) + geom_violin() + xlab("no of cylinders") +
  ggtitle("box plot for mpgs")


#interactive plots with plotly. Intsa
library(plotly)

d <- diamonds[sample(nrow(diamonds), 1000), ]
plot_ly(d, x = ~carat, y = ~price, color = ~carat, size = ~carat, text = ~paste("Clarity: ", clarity))

max(mtcars[,"mpg"])
mean(mtcars$mpg)

ind = which.max(mtcars$mpg)
rownames(mtcars)[ind]

ind1 = which(mtcars$mpg > 20)
rownames(mtcars)[ind1]

which(mtcars$mpg == max(mtcars$mpg))

usar = USArrests
m = which(usar$Murder == max(usar$Murder))
which.max(usar$Murder)
rownames(usar)[m]

# and in condition - &, or - |

sortUSArrests = USArrests[order(USArrests$Rape),]
#for sorting in decreasing order
sortUSArrests = USArrests[order(-USArrests$Rape),]

sortUSArrests = sortUSArrests[-(1:3),]

# sortUSArrests = sortUSArrests[-c(1,2,3),]

