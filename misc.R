
[[R]]

[[mes codes R|Setting Working Directory]]

[[2.0 mon code/twitter_sentiment_analysis_2016|Setting Working Directory]]##**********Steps to Set up authorization to connect and extract tweets********


### Setting Working Directory
setwd("C:/Users/rpand/Desktop/Documents/Classes/Classes/Sentiment_Accelerator")
# tweets

``` R

[[tweets]] 

library(twitteR)
library(ROAuth)
library(plyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(httr)
library(wordcloud)
library(sentimentanalysis)
library(curl)
library(syuzhet)

oauth_endpoint(authorize = "https://api.twitter.com/oauth",
               access = "https://api.twitter.com/oauth/access_token")

[[connect]] to API
download.file(url='http://curl.haxx.se/ca/cacert.pem', destfile='cacert.pem')
reqURL <- 'https://api.twitter.com/oauth/request_token'
accessURL <- 'https://api.twitter.com/oauth/access_token'
authURL <- 'https://api.twitter.com/oauth/authorize'

### Twitter Application
consumerKey="****"
consumerSecret="K****"
accesstoken="****"
accesssecret="****"

Cred <- OAuthFactory$new(consumerKey=consumerKey,
                         consumerSecret=consumerSecret,
                         requestURL=reqURL,
                         accessURL=accessURL,
                         authURL=authURL)
Cred$handshake(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl')) [[There]] is URL in Console. You need to go to it, get code and enter it on Console

##### Authorization PIN -DYNAMIC

save(Cred, file='twitter authentication.Rdata')

load('twitter authentication.Rdata') 
[[Once]] you launch the code first time, you can start from this line in the future (libraries should be connected)

setup_twitter_oauth(consumerKey, consumerSecret, accesstoken, accesssecret )




##****************Step 3: Perform tweets extraction and data cleaning****************

# Harvest some tweets

some_tweets = search_tweets("#rstudioconf", n=100000, include_rts =FALSE)

# Explore Tweets

length.some_tweets <- length(some_tweets)
length.some_tweets

some_tweets.df <- ldply(some_tweets, function(t) t$toDataFrame())
write.csv(some_tweets.df, "tweets.csv")

# get the text
some_txt = sapply(some_tweets, function(x) x$getText())

# Cleaning 1-  remove people name, RT text etc. 

some_txt1 = gsub("(RT|via)((?:\\b\\W*@\\w+)+)","",some_txt)

# Cleaning 2- remove html links
some_txt2 = gsub("http[^[:blank:]]+", "", some_txt1)

# Cleaning 3- remove people names

some_txt3 = gsub("@\\w+", "", some_txt2)

# Cleaning 4- remove Punctuations 

some_txt4 = gsub("[[:punct:]]", " ", some_txt3)

# Cleaning 5- remove Punctuations 

some_txt5 = gsub("[^[:alnum:]]", " ", some_txt4)

# Exporting to Excel

write.csv(some_txt5, "tweets1.csv")

# Creating wordcorpus and cleaning

some_txt6 <- Corpus(VectorSource(some_txt5))
some_txt6 <- tm_map(some_txt6, removePunctuation)
some_txt6 <- tm_map(some_txt6, content_transformer(tolower))
some_txt6 <- tm_map(some_txt6, removeWords, stopwords("english"))
some_txt6 <- tm_map(some_txt6, stripWhitespace)

# Building wordcloud

pal <- brewer.pal(12,"Dark2")

wordcloud(some_txt6, min.freq = 5,  max.words = Inf, width=1000, height =1000,  random.order = FALSE, color=pal)

# Sentiment Analysis

# how the function works

get_nrc_sentiment("I bought an iPhone a few days ago. It is such a nice phone, although a little large. The touch screen is cool.The voice quality is clear too. I simply love it!")

# Running on our data

mysentiment <- get_nrc_sentiment(some_txt5)
SentimentScores <- data.frame(colSums(mysentiment[,]))
names(SentimentScores) <- "Score"
SentimentScores <- cbind("sentiment" = rownames(SentimentScores), SentimentScores)
rownames(SentimentScores) <- NULL
ggplot(data = SentimentScores, aes(x = sentiment, y = Score)) +
  geom_bar(aes(fill = sentiment), stat = "identity") +
  theme(legend.position = "none") +
  xlab("Sentiment") + ylab("Score") + ggtitle("Total Sentiment Score Based on Tweets")



-------------------------
  
  
  
  [[Technology]]: I used R for the analysis (here is the code) 

##Auteur: Dominique Loyer


[[Question]] 1 and 2 and exploration of data

Census <- read.csv("~/Desktop/CensusClean.csv")
View(Census)
summary(Census)
attach(Census)
str(Census)
head(Census)
tail(Census)
getwd()
pwc <- readxl::read_excel("Census.xlsx")
pwc <- read("Census.xlsx")
view(pwc)
pwc
View(pwc)
str(pwc)
head(pwc)
subset (pwc, Education %in% "Masters")
subset (pwc, Education %in% "Masters" AND `Income Group` %in% "50k" OR `Income Group` %in% "50k.")
subset (pwc, Education %in% "Masters" AND Income Group %in% "50k" OR Income Group %in% "50k.")
subset (pwc, Education %in% "Masters" OR "Doctorates")
subset (pwc, Education %in% "Masters" | "Doctorates")
subset (pwc, Education %in% "Masters"|"Doctorates")
subset (pwc, Education %in% "Masters")
master <- subset (pwc, Education %in% "Masters")
filter(master)
master50kplus <- subset (pwc, `Income Group` %in% "50k")
master50kplus
master50kplusDot <- subset (master50kplus, `Income Group` %in% "50k.")
master50kplusDot
master
master50kplus <- subset (master, `Income Group` %in% "50k")
master50kplus
master50kplus <- subset (master, `Income Group` %in% ">50k")
master50kplus
master50kplus <- subset (master, `Income Group` %in% >50k)
master50kplus <- subset (master, `Income Group` >50k)
master50kplus <- subset (master, `Income Group` >50k)
master
master$`Income Group`
master50kplus <- subset (master, `Income Group` %in% ">50K")
master50kplus
master50kplusDot <- subset (master50kplus, `Income Group` %in% ">50K.")
master50kplusDot
master50kplus
master50kplusDot <- subset (master, `Income Group` %in% ">50K.")
master50kplus+master50kplusDot
master50kplusDot
dim(master50kplus)
dim(master50kplusDot)
426+500
totalMaster50kplus <- 500+426
totalMaster50kplus
doctorate <- subset (pwc, Education %in% "Doctorate")
doctorate
doctorate50kplus <- subset (doctorate, `Income Group` %in% ">50K")
doctorate50kplus
doctorate50kplusDot <- subset (doctorate, `Income Group` %in% ">50K.")
doctorate50kplusDot
dim(doctorate50kplus)
dim(doctorate50kplusDot)
totalDoctorate50plus <- 130+125
totalDoctorate50plus
totalDoctorate50plus+totalMaster50kplus
TotalDocPlusMasterEarn50kplus <- totalDoctorate50plus+totalMaster50kplus
TotalDocPlusMasterEarn50kplus / 30511
people50less <- subset (pwc, `Income Group` %in% "<=50K")
people50less
people50lessDot <- subset (pwc, `Income Group` %in% "<=50K.")
people50lessDot
dim(people50less)
dim(people50lessDot)
peopleLess50K <- 10835+12430
peopleLess50K
plot(peopleLess50K)
hist(peopleLess50K)


[[Question]] 3

##Cleaningmytreeadult

###categorical variables as factor
pwcClean$workclass <- as.factor(pwcClean$workclass)
pwcClean$`Income Group` <- as.factor(pwcClean$`Income Group`)
pwcClean$Education <- as.factor(pwcClean$Education)
pwcClean$`Occupation Status` <- as.factor(pwcClean$`Occupation Status`)
pwcClean$Relationship <- as.factor(pwcClean$Relationship)
pwcClean$Gender <- as.factor(pwcClean$Gender)
pwcClean$`Native country` <- as.factor(pwcClean$`Native country`)
summary(pwcClean)
pwcClean$`Marital Status` <- as.factor(pwcClean$`Marital Status`)
summary(pwcClean)
pwcClean$Age=(pwcClean$Age-min(pwcClean$Age))/(max(pwcClean$Age)-min(pwcClean$Age))

range(pwcClean$`Demographic Adjustment`)
hist(pwcClean$`Demographic Adjustment`)

###replacing missing values and merging Income Group (50k and 50k.)

install.packages("tidyr")
library("tidyr")
pwc$`Occupation Status` <- sub("?", "Other-service", pwc$`Occupation Status`)
subset (pwc, Education %in% "Masters" AND `Income Group` %in% "50k" OR `Income Group` %in% "50k.")
pwc$workclass[pwc$workclass==" ?"] = as.character(sample(pwc$workclass[which(pwc$workclass !=" ?")], 1774, replace = FALSE))
people50lessDot <- subset (pwc, `Income Group` %in% "<=50K.")
people50less <- subset (pwc, `Income Group` %in% "<=50K")



###normalization with Min-Max
pwcClean$`Demographic Adjustment`=(pwcClean$`Demographic Adjustment`-min(pwcClean$`Demographic Adjustment`))/(max(pwcClean$`Demographic Adjustment`)-min(pwcClean$`Demographic Adjustment`))
hist(pwcClean$`Demographic Adjustment`)
pwcClean$`Years of Education`=(pwcClean$`Years of Education`-min(pwcClean$`Years of Education`))/(max(pwcClean$`Years of Education`)-min(pwcClean$`Years of Education))
pwcClean$`Years of Education`=(pwcClean$`Years of Education`-min(pwcClean$`Years of Education`))/(max(pwcClean$`Years of Education`)-min(pwcClean$`Years of Education))
pwcClean$`Years of Education`=(pwcClean$`Years of Education`-min(pwcClean$`Years of Education`))/(max(pwcClean$`Years of Education`)-min(pwcClean$`Years of Education`))
pwcClean$`capital-gain`=(pwcClean$`capital-gain`-min(pwcClean$`capital-gain`))/(max(pwcClean$`capital-gain`)-min(pwcClean$`capital-gain`))
pwcClean$`capital-loss`=(pwcClean$`capital-loss`-min(pwcClean$`capital-loss`))/(max(pwcClean$`capital-loss`)-min(pwcClean$`capital-loss`))
pwcClean$`hours-per-week`=(pwcClean$`hours-per-week`-min(pwcClean$`hours-per-week`))/(max(pwcClean$`hours-per-week`)-min(pwcClean$`hours-per-week`))

###Normalized and cleaned data
pwcClean.normalized <- pwcClean
pwcClean.normalizedCopy <- pwcClean.normalized



[[Decision]] Tree
##pruning the tree with rpart
install.packages("rpart")
library(rpart)
library(rpart.plot)
mytreeadult=rpart(`Income Group`~Education+workclass+`Occupation Status`+Gender+Age+`hours-per-week`
                  , data=pwcClean.normalized, method="class", control=rpart.control(minsplit=1))
mytreeadult
plot(mytreeadult)
rpart.plot(mytreeadult, type=3, extra=101, fallen.leaves = TRUE)
text(mytreeadult, use.n=T, all=T, pretty=0, cex=0.9, xpd=TRUE)
estincome.class=predict(mytreeadult, data=pwcClean.normalized, type="class")

##cross-validation table

t1=table(`Income Group`, estincome.class)
t1
(10061+1354)+(11564+1505)/30511
(10061+1354+11564+1505)/30511



###Training data 20000 out of 30511
index <- sample(1:nrow(pwcClean.normalized), 20000)
pwc.test = pwcClean.normalized[index,]
pwc.valid = pwcClean.normalized[-index,]

###validation data
Tpwc=table(pwc.valid$`Income Group`,pwc.valid$est.income)
Tpwc
(7457+1519)/(30511-20000)

[[Neural]] network with 10 hidden layers

require(nnet)
library(nnet)
set.seed(99999999)

pwc.net = nnet(`Income Group`~.,data=pwc.test,size=10)
pwc.valid$est.income = predict(pwc.net,pwc.valid,type="class")
Tpwc=table(pwc.valid$`Income Group`,pwc.valid$est.income)
Tpwc


clear(
  
)
rpart(formula, data=, method=,control=)
###
rpart(formula, data=, method=,control=)
fit<-rpart(Default_On_Payment~Status_Checking_Acc+Duration_in_Months+Credit_History+Purposre_Credit_Taken+
             Credit_Amount+Savings_Acc+Years_At_Present_Employment+Inst_Rt_Income+Marital_Status_Gender+
             Other_Debtors_Guarantors+Current_Address_Yrs+Property+Age+Other_Inst_Plans+Housing+
             Num_CC+Job+Dependents+Telephone+Foreign_Worker,
           data=cust_data, method="class",
           control=rpart.control(minsplit=20, cp=0.01))



-------------------------
  
  
  [[PWC]]

2044 master and doctorate plus grand que 50k 1181 = 3,87%
23265 plus petit ou égal 50k


missing data
workclass 1769
occupation Status 1774
native country 531	

Census <- read_excel("~/Desktop/PwC/Census.xlsx")
View(Census)
summary(Census)
attach(Census)
str(Census)
head(Census)
tail(Census)
getwd()
pwc <- read_excel("Census.xlsx")
view(pwc)
pwc
View(pwc)
str(pwc)
head(pwc)
subset (pwc, Education %in% "Masters")
subset (pwc, Education %in% "Masters" AND `Income Group` %in% "50k" OR `Income Group` %in% "50k.")
subset (pwc, Education %in% "Masters" AND Income Group %in% "50k" OR Income Group %in% "50k.")
subset (pwc, Education %in% "Masters" OR "Doctorates")
subset (pwc, Education %in% "Masters" | "Doctorates")
subset (pwc, Education %in% "Masters"|"Doctorates")
subset (pwc, Education %in% "Masters")
master <- subset (pwc, Education %in% "Masters")
filter(master)
master50kplus <- subset (pwc, `Income Group` %in% "50k")
master50kplus
master50kplusDot <- subset (master50kplus, `Income Group` %in% "50k.")
master50kplusDot
master
master50kplus <- subset (master, `Income Group` %in% "50k")
master50kplus
master50kplus <- subset (master, `Income Group` %in% ">50k")
master50kplus
master50kplus <- subset (master, `Income Group` %in% >50k)
master50kplus <- subset (master, `Income Group` >50k)
master50kplus <- subset (master, `Income Group` >50k)
master
master$`Income Group`
master50kplus <- subset (master, `Income Group` %in% ">50K")
master50kplus
master50kplusDot <- subset (master50kplus, `Income Group` %in% ">50K.")
master50kplusDot
master50kplus
master50kplusDot <- subset (master, `Income Group` %in% ">50K.")
master50kplus+master50kplusDot
master50kplusDot
dim(master50kplus)
dim(master50kplusDot)
426+500
totalMaster50kplus <- 500+426
totalMaster50kplus
doctorate <- subset (pwc, Education %in% "Doctorate")
doctorate
doctorate50kplus <- subset (doctorate, `Income Group` %in% ">50K")
doctorate50kplus
doctorate50kplusDot <- subset (doctorate, `Income Group` %in% ">50K.")
doctorate50kplusDot
dim(doctorate50kplus)
dim(doctorate50kplusDot)
totalDoctorate50plus <- 130+125
totalDoctorate50plus
totalDoctorate50plus+totalMaster50kplus
TotalDocPlusMasterEarn50kplus <- totalDoctorate50plus+totalMaster50kplus
TotalDocPlusMasterEarn50kplus / 30511
people50less <- subset (pwc, `Income Group` %in% "<=50K")
people50less
people50lessDot <- subset (pwc, `Income Group` %in% "<=50K.")
people50lessDot
dim(people50less)
dim(people50lessDot)
peopleLess50K <- 10835+12430
peopleLess50K
plot(peopleLess50K)
hist(peopleLess50K)
hist(pwc)
subset (pwc, Age <=18)
subset (pwc, Age <=15)
subset (pwc, Age <=16)
subset (pwc, Age <=17)



-------------------
  
  [[tweets]]

##**********Steps to Set up authorization to connect and extract tweets********
### Setting Working Directory
setwd("/Users/SherbrookeInformatique/Bureau")


library(twitteR)
library(ROAuth)
library(plyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(httr)
library(wordcloud)
library(sentiment)
library(RCurl)
library(syuzhet)
library(sentimentr)
# load twitter library - the rtweet library is recommended now over twitteR
library(rtweet)
# plotting and pipes - tidyverse!
library(ggplot2)
library(dplyr)
# text mining library
library(tidytext)

install.packages("httpuv")
library(httpuv)



### Fill out my tokens
consumer_key=""
consumer_secret=""
access_token=""
access_secret=""



setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
ytw = twitteR::searchTwitter('#realDonaldTrump + [[HillaryClinton]]', n = 6, since = '2016-11-08', retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)

oauth_endpoint(authorize = "https://api.twitter.com/oauth",
               access = "https://api.twitter.com/oauth/access_token")

[[connect]] to API
download.file(url='http://curl.haxx.se/ca/cacert.pem', destfile='cacert.pem')
reqURL <- 'https://api.twitter.com/oauth/request_token'
accessURL <- 'https://api.twitter.com/oauth/access_token'
authURL <- 'https://api.twitter.com/oauth/authorize'

### put my credientials here
consumer_key=""
consumer_secret=""
access_token=""
access_token_secret=""

Cred <- OAuthFactory$new(consumerKey=consumerKey,
                         consumerSecret=consumerSecret,
                         requestURL=reqURL,
                         accessURL=accessURL,
                         authURL=authURL)
Cred$handshake(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl')) [[There]] is URL in Console. You need to go to it, get code and enter it on Console

##### Authorization PIN -DYNAMIC


Elec = search_tweets("#Election2020", n=100000, lang='en', include_rts=FALSE)
Elec





save(Cred, file='twitter authentication.Rdata')

load('twitter authentication.Rdata') 
[[Once]] you launch the code first time, you can start from this line in the future (libraries should be connected)

setup_twitter_oauth(consumer_key=consumerKey, consumer_secret=consumerSecret, access_token =accesstoken, access_secret = accesssecret )



##****************Step 3: Perform tweets extraction and data cleaning****************

# Harvest some tweets

some_tweets = searchTwitter("Election2020", n=1000, since = "2020-11-03", lang= "en")

# Explore Tweets

length.some_tweets <- length(some_tweets)
length.some_tweets

some_tweets.df <- ldply(some_tweets, function(t) t$toDataFrame())
write.csv(some_tweets.df, "tweets.csv")

# get the text
some_txt = sapply(some_tweets, function(x) x$getText())

# Cleaning 1-  remove people name, RT text etc. 

some_txt1 = gsub("(RT|via)((?:\\b\\W*@\\w+)+)","",some_txt)

# Cleaning 2- remove html links
some_txt2 = gsub("http[^[:blank:]]+", "", some_txt1)

# Cleaning 3- remove people names

some_txt3 = gsub("@\\w+", "", some_txt2)

# Cleaning 4- remove Punctuations 

some_txt4 = gsub("[[:punct:]]", " ", some_txt3)

# Cleaning 5- remove Punctuations 

some_txt5 = gsub("[^[:alnum:]]", " ", some_txt4)

# Exporting to Excel

write.csv(some_txt5, "tweets1.csv")

# Creating wordcorpus and cleaning

some_txt6 <- Corpus(VectorSource(some_txt5))
some_txt6 <- tm_map(some_txt6, removePunctuation)
some_txt6 <- tm_map(some_txt6, content_transformer(tolower))
some_txt6 <- tm_map(some_txt6, removeWords, stopwords("english"))
some_txt6 <- tm_map(some_txt6, stripWhitespace)

# Building wordcloud

pal <- brewer.pal(12,"Dark2")

wordcloud(some_txt6, min.freq = 5,  max.words = Inf, width=1000, height =1000,  random.order = FALSE, color=pal)

y# Sentiment Analysis

# how the function works

get_nrc_sentiment("I bought an iPhone a few days ago. It is such a nice phone, although a little large. The touch screen is cool.The voice quality is clear too. I simply love it!")

# Running on our data

mysentiment <- get_nrc_sentiment(some_txt5)
SentimentScores <- data.frame(colSums(some_txt5[,]))
names(SentimentScores) <- "Score"
SentimentScores <- cbind("sentiment" = rownames(SentimentScores), SentimentScores)
rownames(SentimentScores) <- NULL
ggplot(data = SentimentScores, aes(x = sentiment, y = Score)) +
  geom_bar(aes(fill = sentiment), stat = "identity") +
  theme(legend.position = "none") +
  xlab("Sentiment") + ylab("Score") + ggtitle("Total Sentiment Score Based on Tweets")






---------------------
  
  [[tweets]] 

##**********Steps to Set up authorization to connect and extract tweets********
### Setting Working Directory
setwd("C:/Users/rpand/Desktop/Documents/Classes/Classes/Sentiment_Accelerator")


library(twitteR)
library(ROAuth)
library(plyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(httr)
library(wordcloud)
library(sentimentanalysis)
library(curl)
library(syuzhet)

oauth_endpoint(authorize = "https://api.twitter.com/oauth",
               access = "https://api.twitter.com/oauth/access_token")

[[connect]] to API
download.file(url='http://curl.haxx.se/ca/cacert.pem', destfile='cacert.pem')
reqURL <- 'https://api.twitter.com/oauth/request_token'
accessURL <- 'https://api.twitter.com/oauth/access_token'
authURL <- 'https://api.twitter.com/oauth/authorize'

### Twitter Application
consumerKey="U9PZprvQsTHlEAhr87oyc0mhY"
consumerSecret="KphaxCtCh5XDw0t4e4JCJ7pv3R7lPnRQ10PYgwEkEPJPdo0UX0"
accesstoken="1084536220141740035-ywa1yvmxzPni8Kt8pjmxVP07gmz253"
accesssecret="Kkk2CQVGWynjJfGsXgZsQiXRuBIHWfC8gHVZa5DcQtbgLg"

Cred <- OAuthFactory$new(consumerKey=consumerKey,
                         consumerSecret=consumerSecret,
                         requestURL=reqURL,
                         accessURL=accessURL,
                         authURL=authURL)
Cred$handshake(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl')) [[There]] is URL in Console. You need to go to it, get code and enter it on Console

##### Authorization PIN -DYNAMIC

save(Cred, file='twitter authentication.Rdata')

load('twitter authentication.Rdata') 
[[Once]] you launch the code first time, you can start from this line in the future (libraries should be connected)

setup_twitter_oauth(consumerKey, consumerSecret, accesstoken, accesssecret )




##****************Step 3: Perform tweets extraction and data cleaning****************

# Harvest some tweets

some_tweets = search_tweets("#rstudioconf", n=1000, include_rts =FALSE)

# Explore Tweets

length.some_tweets <- length(some_tweets)
length.some_tweets

some_tweets.df <- ldply(some_tweets, function(t) t$toDataFrame())
write.csv(some_tweets.df, "tweets.csv")

# get the text
some_txt = sapply(some_tweets, function(x) x$getText())

# Cleaning 1-  remove people name, RT text etc. 

some_txt1 = gsub("(RT|via)((?:\\b\\W*@\\w+)+)","",some_txt)

# Cleaning 2- remove html links
some_txt2 = gsub("http[^[:blank:]]+", "", some_txt1)

# Cleaning 3- remove people names

some_txt3 = gsub("@\\w+", "", some_txt2)

# Cleaning 4- remove Punctuations 

some_txt4 = gsub("[[:punct:]]", " ", some_txt3)

# Cleaning 5- remove Punctuations 

some_txt5 = gsub("[^[:alnum:]]", " ", some_txt4)

# Exporting to Excel

write.csv(some_txt5, "tweets1.csv")

# Creating wordcorpus and cleaning

some_txt6 <- Corpus(VectorSource(some_txt5))
some_txt6 <- tm_map(some_txt6, removePunctuation)
some_txt6 <- tm_map(some_txt6, content_transformer(tolower))
some_txt6 <- tm_map(some_txt6, removeWords, stopwords("english"))
some_txt6 <- tm_map(some_txt6, stripWhitespace)

# Building wordcloud

pal <- brewer.pal(12,"Dark2")

wordcloud(some_txt6, min.freq = 5,  max.words = Inf, width=1000, height =1000,  random.order = FALSE, color=pal)

# Sentiment Analysis

# how the function works

get_nrc_sentiment("I bought an iPhone a few days ago. It is such a nice phone, although a little large. The touch screen is cool.The voice quality is clear too. I simply love it!")

# Running on our data


mysentiment <- get_nrc_sentiment(some_txt5)
SentimentScores <- data.frame(colSums(mysentiment[,]))
names(SentimentScores) <- "Score"
SentimentScores <- cbind("sentiment" = rownames(SentimentScores), SentimentScores)
rownames(SentimentScores) <- NULL
ggplot(data = SentimentScores, aes(x = sentiment, y = Score)) +
  geom_bar(aes(fill = sentiment), stat = "identity") +
  theme(legend.position = "none") +
  xlab("Sentiment") + ylab("Score") + ggtitle("Total Sentiment Score Based on Tweets")

```
# PWC

```R
[[Technology]]: I used R for the analysis (here is the code) 

##Auteur: Dominique Loyer


[[Question]] 1 and 2 and exploration of data

Census <- read.csv("~/Desktop/CensusClean.csv")
View(Census)
summary(Census)
attach(Census)
str(Census)
head(Census)
tail(Census)
getwd()
pwc <- readxl::read_excel("Census.xlsx")
pwc <- read("Census.xlsx")
view(pwc)
pwc
View(pwc)
str(pwc)
head(pwc)
subset (pwc, Education %in% "Masters")
subset (pwc, Education %in% "Masters" AND `Income Group` %in% "50k" OR `Income Group` %in% "50k.")
subset (pwc, Education %in% "Masters" AND Income Group %in% "50k" OR Income Group %in% "50k.")
subset (pwc, Education %in% "Masters" OR "Doctorates")
subset (pwc, Education %in% "Masters" | "Doctorates")
subset (pwc, Education %in% "Masters"|"Doctorates")
subset (pwc, Education %in% "Masters")
master <- subset (pwc, Education %in% "Masters")
filter(master)
master50kplus <- subset (pwc, `Income Group` %in% "50k")
master50kplus
master50kplusDot <- subset (master50kplus, `Income Group` %in% "50k.")
master50kplusDot
master
master50kplus <- subset (master, `Income Group` %in% "50k")
master50kplus
master50kplus <- subset (master, `Income Group` %in% ">50k")
master50kplus
master50kplus <- subset (master, `Income Group` %in% >50k)
master50kplus <- subset (master, `Income Group` >50k)
master50kplus <- subset (master, `Income Group` >50k)
master
master$`Income Group`
master50kplus <- subset (master, `Income Group` %in% ">50K")
master50kplus
master50kplusDot <- subset (master50kplus, `Income Group` %in% ">50K.")
master50kplusDot
master50kplus
master50kplusDot <- subset (master, `Income Group` %in% ">50K.")
master50kplus+master50kplusDot
master50kplusDot
dim(master50kplus)
dim(master50kplusDot)
426+500
totalMaster50kplus <- 500+426
totalMaster50kplus
doctorate <- subset (pwc, Education %in% "Doctorate")
doctorate
doctorate50kplus <- subset (doctorate, `Income Group` %in% ">50K")
doctorate50kplus
doctorate50kplusDot <- subset (doctorate, `Income Group` %in% ">50K.")
doctorate50kplusDot
dim(doctorate50kplus)
dim(doctorate50kplusDot)
totalDoctorate50plus <- 130+125
totalDoctorate50plus
totalDoctorate50plus+totalMaster50kplus
TotalDocPlusMasterEarn50kplus <- totalDoctorate50plus+totalMaster50kplus
TotalDocPlusMasterEarn50kplus / 30511
people50less <- subset (pwc, `Income Group` %in% "<=50K")
people50less
people50lessDot <- subset (pwc, `Income Group` %in% "<=50K.")
people50lessDot
dim(people50less)
dim(people50lessDot)
peopleLess50K <- 10835+12430
peopleLess50K
plot(peopleLess50K)
hist(peopleLess50K)


[[Question]] 3

##Cleaningmytreeadult

###categorical variables as factor
pwcClean$workclass <- as.factor(pwcClean$workclass)
pwcClean$`Income Group` <- as.factor(pwcClean$`Income Group`)
pwcClean$Education <- as.factor(pwcClean$Education)
pwcClean$`Occupation Status` <- as.factor(pwcClean$`Occupation Status`)
pwcClean$Relationship <- as.factor(pwcClean$Relationship)
pwcClean$Gender <- as.factor(pwcClean$Gender)
pwcClean$`Native country` <- as.factor(pwcClean$`Native country`)
summary(pwcClean)
pwcClean$`Marital Status` <- as.factor(pwcClean$`Marital Status`)
summary(pwcClean)
pwcClean$Age=(pwcClean$Age-min(pwcClean$Age))/(max(pwcClean$Age)-min(pwcClean$Age))

range(pwcClean$`Demographic Adjustment`)
hist(pwcClean$`Demographic Adjustment`)

###replacing missing values and merging Income Group (50k and 50k.)

install.packages("tidyr")
library("tidyr")
pwc$`Occupation Status` <- sub("?", "Other-service", pwc$`Occupation Status`)
subset (pwc, Education %in% "Masters" AND `Income Group` %in% "50k" OR `Income Group` %in% "50k.")
pwc$workclass[pwc$workclass==" ?"] = as.character(sample(pwc$workclass[which(pwc$workclass !=" ?")], 1774, replace = FALSE))
people50lessDot <- subset (pwc, `Income Group` %in% "<=50K.")
people50less <- subset (pwc, `Income Group` %in% "<=50K")



###normalization with Min-Max
pwcClean$`Demographic Adjustment`=(pwcClean$`Demographic Adjustment`-min(pwcClean$`Demographic Adjustment`))/(max(pwcClean$`Demographic Adjustment`)-min(pwcClean$`Demographic Adjustment`))
hist(pwcClean$`Demographic Adjustment`)
pwcClean$`Years of Education`=(pwcClean$`Years of Education`-min(pwcClean$`Years of Education`))/(max(pwcClean$`Years of Education`)-min(pwcClean$`Years of Education))
pwcClean$`Years of Education`=(pwcClean$`Years of Education`-min(pwcClean$`Years of Education`))/(max(pwcClean$`Years of Education`)-min(pwcClean$`Years of Education))
pwcClean$`Years of Education`=(pwcClean$`Years of Education`-min(pwcClean$`Years of Education`))/(max(pwcClean$`Years of Education`)-min(pwcClean$`Years of Education`))
pwcClean$`capital-gain`=(pwcClean$`capital-gain`-min(pwcClean$`capital-gain`))/(max(pwcClean$`capital-gain`)-min(pwcClean$`capital-gain`))
pwcClean$`capital-loss`=(pwcClean$`capital-loss`-min(pwcClean$`capital-loss`))/(max(pwcClean$`capital-loss`)-min(pwcClean$`capital-loss`))
pwcClean$`hours-per-week`=(pwcClean$`hours-per-week`-min(pwcClean$`hours-per-week`))/(max(pwcClean$`hours-per-week`)-min(pwcClean$`hours-per-week`))

###Normalized and cleaned data
pwcClean.normalized <- pwcClean
pwcClean.normalizedCopy <- pwcClean.normalized



[[Decision]] Tree
##pruning the tree with rpart
install.packages("rpart")
library(rpart)
library(rpart.plot)
mytreeadult=rpart(`Income Group`~Education+workclass+`Occupation Status`+Gender+Age+`hours-per-week`
                  , data=pwcClean.normalized, method="class", control=rpart.control(minsplit=1))
mytreeadult
plot(mytreeadult)
rpart.plot(mytreeadult, type=3, extra=101, fallen.leaves = TRUE)
text(mytreeadult, use.n=T, all=T, pretty=0, cex=0.9, xpd=TRUE)
estincome.class=predict(mytreeadult, data=pwcClean.normalized, type="class")

##cross-validation table

t1=table(`Income Group`, estincome.class)
t1
(10061+1354)+(11564+1505)/30511
(10061+1354+11564+1505)/30511



###Training data 20000 out of 30511
index <- sample(1:nrow(pwcClean.normalized), 20000)
pwc.test = pwcClean.normalized[index,]
pwc.valid = pwcClean.normalized[-index,]

###validation data
Tpwc=table(pwc.valid$`Income Group`,pwc.valid$est.income)
Tpwc
(7457+1519)/(30511-20000)

[[Neural]] network with 10 hidden layers

require(nnet)
library(nnet)
set.seed(99999999)

pwc.net = nnet(`Income Group`~.,data=pwc.test,size=10)
pwc.valid$est.income = predict(pwc.net,pwc.valid,type="class")
Tpwc=table(pwc.valid$`Income Group`,pwc.valid$est.income)
Tpwc


clear(
  
)
rpart(formula, data=, method=,control=)
###
rpart(formula, data=, method=,control=)
fit<-rpart(Default_On_Payment~Status_Checking_Acc+Duration_in_Months+Credit_History+Purposre_Credit_Taken+
             Credit_Amount+Savings_Acc+Years_At_Present_Employment+Inst_Rt_Income+Marital_Status_Gender+
             Other_Debtors_Guarantors+Current_Address_Yrs+Property+Age+Other_Inst_Plans+Housing+
             Num_CC+Job+Dependents+Telephone+Foreign_Worker,
           data=cust_data, method="class",
           control=rpart.control(minsplit=20, cp=0.01))











```
# Tweets Word Cloud
```R
##**********Steps to Set up authorization to connect and extract tweets********
### Setting Working Directory
setwd("C:/Users/rpand/Desktop/Documents/Classes/Classes/Sentiment_Accelerator")


library(twitteR)
library(ROAuth)
library(plyr)
library(dplyr)
library(stringr)
library(ggplot2)
library(httr)
library(wordcloud)
library(sentimentanalysis)
library(curl)
library(syuzhet)

oauth_endpoint(authorize = "https://api.twitter.com/oauth",
               access = "https://api.twitter.com/oauth/access_token")

[[connect]] to API
download.file(url='http://curl.haxx.se/ca/cacert.pem', destfile='cacert.pem')
reqURL <- 'https://api.twitter.com/oauth/request_token'
accessURL <- 'https://api.twitter.com/oauth/access_token'
authURL <- 'https://api.twitter.com/oauth/authorize'

### Twitter Application
consumerKey="****"
consumerSecret="K****"
accesstoken="****"
accesssecret="****"

Cred <- OAuthFactory$new(consumerKey=consumerKey,
                         consumerSecret=consumerSecret,
                         requestURL=reqURL,
                         accessURL=accessURL,
                         authURL=authURL)
Cred$handshake(cainfo = system.file('CurlSSL', 'cacert.pem', package = 'RCurl')) [[There]] is URL in Console. You need to go to it, get code and enter it on Console

##### Authorization PIN -DYNAMIC

save(Cred, file='twitter authentication.Rdata')

load('twitter authentication.Rdata') 
[[Once]] you launch the code first time, you can start from this line in the future (libraries should be connected)

setup_twitter_oauth(consumerKey, consumerSecret, accesstoken, accesssecret )




##****************Step 3: Perform tweets extraction and data cleaning****************

# Harvest some tweets

some_tweets = search_tweets("#rstudioconf", n=100000, include_rts =FALSE)

# Explore Tweets

length.some_tweets <- length(some_tweets)
length.some_tweets

some_tweets.df <- ldply(some_tweets, function(t) t$toDataFrame())
write.csv(some_tweets.df, "tweets.csv")

# get the text
some_txt = sapply(some_tweets, function(x) x$getText())

# Cleaning 1-  remove people name, RT text etc. 

some_txt1 = gsub("(RT|via)((?:\\b\\W*@\\w+)+)","",some_txt)

# Cleaning 2- remove html links
some_txt2 = gsub("http[^[:blank:]]+", "", some_txt1)

# Cleaning 3- remove people names

some_txt3 = gsub("@\\w+", "", some_txt2)

# Cleaning 4- remove Punctuations 

some_txt4 = gsub("[[:punct:]]", " ", some_txt3)

# Cleaning 5- remove Punctuations 

some_txt5 = gsub("[^[:alnum:]]", " ", some_txt4)

# Exporting to Excel

write.csv(some_txt5, "tweets1.csv")

# Creating wordcorpus and cleaning

some_txt6 <- Corpus(VectorSource(some_txt5))
some_txt6 <- tm_map(some_txt6, removePunctuation)
some_txt6 <- tm_map(some_txt6, content_transformer(tolower))
some_txt6 <- tm_map(some_txt6, removeWords, stopwords("english"))
some_txt6 <- tm_map(some_txt6, stripWhitespace)

# Building wordcloud

pal <- brewer.pal(12,"Dark2")

wordcloud(some_txt6, min.freq = 5,  max.words = Inf, width=1000, height =1000,  random.order = FALSE, color=pal)

# Sentiment Analysis

# how the function works

get_nrc_sentiment("I bought an iPhone a few days ago. It is such a nice phone, although a little large. The touch screen is cool.The voice quality is clear too. I simply love it!")

# Running on our data

mysentiment <- get_nrc_sentiment(some_txt5)
SentimentScores <- data.frame(colSums(mysentiment[,]))
names(SentimentScores) <- "Score"
SentimentScores <- cbind("sentiment" = rownames(SentimentScores), SentimentScores)
rownames(SentimentScores) <- NULL
ggplot(data = SentimentScores, aes(x = sentiment, y = Score)) +
  geom_bar(aes(fill = sentiment), stat = "identity") +
  theme(legend.position = "none") +
  xlab("Sentiment") + ylab("Score") + ggtitle("Total Sentiment Score Based on Tweets")

```


