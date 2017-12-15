install.packages("jsonlite")
library(jsonlite)
install.packages("httpuv")
library(httpuv)
install.packages("httr")
library(httr)
install.packages('plyr')


detach("package:plotly", unload=TRUE)


oauth_endpoints("github")


myapp <- oauth_app(appname = "SoftwareEngineering",
                   key = "683362c6b19f9a8d81d6",
                   secret = "12f43d46d0459f8d092e94aaf47d47d5d8da206e")


# Get OAuth credentials
github_token = oauth2.0_token(oauth_endpoints("github"), myapp)

# Use API
gtoken <- config(token = github_token)
?config
req <- GET("https://api.github.com/users/conorwallace/followers", gtoken)
?config
# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)

# Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))


Followers <- gitDF$login
Followers

repNames<- gitDF$login
name<-repNames[1]
name

currentusername<- "conorwallace"



getfollowers("conorwallace")
# Use API
gtoken <- config(token = github_token)
req <- GET(pasteO("https://api.github.com/users/",name,"/followers", gtoken))

# Take action on http error
stop_for_status(req)

# Extract content from a request
json1 = content(req)



# Convert to a data.frame
FollowersDF = jsonlite::fromJSON(jsonlite::toJSON(json1))



githubURL<-("https://api.github.com")
usersUrl<-("https://api.github.com/users")


###Allow for pagnation
pages<-list()
for(i in 1:10)
{
  mydataPaste<-paste0(usersUrl, "?per_page=1000&page=",i)
  mydata<-GET(mydataPaste,gtoken)
  mydata
  json1 = content(mydata)
  mydataFrame = jsonlite::fromJSON(jsonlite::toJSON(json1))
  message("Retrieving page ", i)
  pages[[i+1]] <- mydataFrame
  logins <- rbind_pages(pages)
}
#logins
loginsName<-logins$login
loginsName
logins$followers_url


followinglist<-c()
followerlist<-c()
namelist<-c()
publicRepos<-c()
dataTypeList<-c()
dataCreatedAt <-c()
dataUpdatedAt <- c()
dataLocation <-  c()
i=1

while(i<120)
{
  loopPaste<-paste0(usersUrl,"/",loginsName[i])
  loopData=GET(loopPaste,gtoken)
  jsonLoop=content(loopData)
  loopDF=jsonlite::fromJSON(jsonlite::toJSON(jsonLoop))
  numFollower<-loopDF$followers
  numFollowing<-loopDF$following
  numRepositories<-loopDF$public_repos
  CreatedAt <- loopDF$created_at
  UpdatedAt <- loopDF$updated_at
  dataType<- loopDF$type
  Location <- loopDF$location
  name<-loopDF$login
  followinglist<-c(followinglist,numFollowing)
  followerlist<-c(followerlist,numFollower)
  publicRepos<-c(publicRepos,numRepositories)
  dataTypeList<-c(dataTypeList,dataType)
  namelist<-c(namelist,name)
  dataCreatedAt<-c(dataCreatedAt,CreatedAt)
  dataUpdatedAt<-c(dataUpdatedAt,UpdatedAt)
  dataLocation<- c(dataLocation, Location)
  
  print(paste0("getting user and details ", i))
  
  i=i+1
}

namelist
followerlist
followinglist
publicRepos
allData <- cbind(namelist,followerlist,followinglist,publicRepos, dataTypeList, dataCreatedAt, dataUpdatedAt, dataLocation )
allData
summary(publicRepos)

head(allData)

#write.csv(allData, file= "SoftwareEng4.csv")
l = content(GET(paste0("https://api.github.com/repos/buckler2/Software-engineering/languages"),gtoken))
l
#PLOTING THE DATA
