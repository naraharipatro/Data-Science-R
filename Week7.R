#web scraping in R

library(RSelenium)

#	run	the	selenium	standalone	server	and	open	firefox
rD = rsDriver(verbose = FALSE, port=4445L)
remDr = rD$client

#Doing Google search 5 times

for(i in 1:5){
remDr$navigate("http://www.google.com")
#prints the URL
remDr$getCurrentUrl()

#search the search box ID and get a handle of it. using specifies whether searching by id or name
webElem = remDr$findElement(using = 'id', "lst-ib")

#\n does the enter automatically  
webElem$sendKeysToElement(list("how old is Obama? \n"))
#webElem = remDr$findElement(using="name","btnK")
#webElem$clickElement()
Sys.sleep(2)

webElem=remDr$findElement(using='xpath',
                "//*[@id='hdtb-msb-vis']/div[4]/a")
webElem$clickElement()
Sys.sleep(2)

}

install.packages()
