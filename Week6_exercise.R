#lab works for clustering (slide 32, week 6)

#load caret
library(ggplot2)


mpg = mpg

#scatter plot between cty & hwy mpg
ggplot(mpg, aes(x=cty,y=hwy)) + geom_point(size=2,color="blue")

clusters = kmeans(mpg[,c("cty","hwy")], 7)
clusters$cluster

#use ggplot to plot petal.length & sepal.length and use the clusters to color them and see how they look
ggplot(mpg,aes(cty, hwy, color=as.character(clusters$cluster))) + geom_point(size=4) + theme_bw() 

ggplot(mpg,aes(cty, hwy, color=as.character(class))) + geom_point(size=4) + theme_bw() 


# to add a col to iris dataset
mpg$clusters = clusters$cluster

#***************************************** Selenium troublehsooting **********************************************

# for selenium logs
library(wdman)
library(RSelenium)
selServ <- selenium(jvmargs = c("-Dwebdriver.chrome.verboseLogging=true"))
remDr <- remoteDriver(port = 4567L, browserName = "chrome")
remDr$open()
selServ$log()

# for starting selenium server manually
#Ref: https://github.com/ropensci/RSelenium/issues/121
selCommand<- wdman::selenium(jvmargs = c("-Dwebdriver.chrome.verboseLogging=true"), retcommand = TRUE)
cat(selCommand)
#run the output of above command in a terminal and then run the following to open chrome
remDr <- remoteDriver(port = 4567L, browserName = "chrome")
remDr$open()

#selenium server status
remDr$getStatus()

#tests
#basics - https://cran.r-project.org/web/packages/RSelenium/vignettes/RSelenium-basics.html
remDr$navigate("http://www.google.com/ncr")
remDr$navigate("http://www.bbc.co.uk")
webElem <- remDr$findElement(using = 'class', value = "advert")
webElem$highlightElement()
