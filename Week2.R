#my first plot - ggplot
library(ggplot2)
mydata = mpg
mpg=mpg

#histogram
ggplot(mpg,aes(hwy))+geom_histogram(bins=10, color="pink", fill="blue") + 
  ggtitle("my plot") + theme_bw() +
  theme(text = element_text(size=15), plot.title = element_text(hjust=.5)) +
 xlab("Highway") + ylab("") + ylim(0,100)

#density plot - normalizes Y values
ggplot(mpg,aes(hwy))+geom_density(color="pink", fill="blue") + 
  ggtitle("my plot") + theme_bw() +
  theme(text = element_text(size=15), plot.title = element_text(hjust=.5)) +
  xlab("Highway") + ylab("")

#bar chart
ggplot(mpg, aes(manufacturer)) + geom_bar(fill="green")

#scatter plot - 2d plots. Add 1 more variable by introducing color. Add 1 more by changing size. So, 4 variables in plot
ggplot(mpg,aes(cty,hwy,color=class,size=class)) + geom_point(alpha=.3) + theme_bw()

#increased dataset size. runif : adds noise so that points dont overlap
newMPG=rbind(mpg,mpg,mpg,mpg,mpg,mpg)
newMPG$hwy=newMPG$hwy+runif(nrow(newMPG),min=0,max=1)

#compare the hwy distributions for each class of car
ggplot(newMPG,aes(class,hwy,color=class))+geom_point()+theme_bw()

#jitter plot - like above but shows density clearly by distributing the points
ggplot(newMPG,aes(class,hwy,color=class))+geom_jitter()+theme_bw()

#violin plot - shows exact shape of distribution
ggplot(newMPG,aes(class,hwy,fill=class))+geom_violin()+theme_bw()
