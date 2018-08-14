# SCI01 Stanford

# make sure to install stringr library first
library(stringr)
library(base)

# read the email
emailWords<-scan("sample.txt", what="char", sep=" ")
emailWords<-tolower(emailWords)
# remove all punctuations
emailWords<-gsub( "[^[:alnum:]]", "", emailWords)

# read the header file
spamHeaders=read.csv("spambaseHeaders.csv",stringsAsFactors = FALSE,row.names = NULL)
# remove substring "word_freq" 
spamWords=sub(".*word_freq_", "", spamHeaders[,1])
# remove colons
spamWords=sub(":.*", "", spamWords)

# find the frequency of words
spamWords=spamWords[31:78]
wordCounts=NULL
for (i in 1:length(spamWords)){
  wordCounts=c(wordCounts,sum(emailWords==spamWords[i]))
}
wordFrequencies=100*wordCounts/length(emailWords)

emailChars<-scan("sample.txt", what="char",sep="")

# let's count the number of special characters
charFrequencies=NULL
specialChars=c("\\;","\\(","\\[","\\!","\\$","\\#")
for (i in (1:length(specialChars))){
  charFrequencies=c(charFrequencies,str_count(paste(emailChars,collapse=""),specialChars[i]))
}
charFrequencies=100*charFrequencies/nchar(paste(emailChars,collapse=""))


charEmail=readChar("sample.txt", file.info("sample.txt")$size)
charEmail=strsplit(charEmail,split="")
booleanCapital=(grepl("[A-Z]",unlist(charEmail)))
capitalIndexes=which(booleanCapital==TRUE)
capitalLength=NULL
ind=1;
while (ind<length(capitalIndexes)){
  len=1
  while(capitalIndexes[ind]==capitalIndexes[ind+1]-1){
    len=len+1
    ind=ind+1
  }
  capitalLength=c(capitalLength,len)
  ind=ind+1
}
if(capitalLength[length(capitalLength)]==1)
  capitalLength=c(capitalLength,1)

capitalFrequencies=c(mean(capitalLength),max(capitalLength),sum(capitalLength))



allFeatures=c(wordFrequencies,charFrequencies,capitalFrequencies)
