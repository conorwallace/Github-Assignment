usernames = unique(namelist)

'due to the length of time it takes to run this for loop I am going to reduce the amount of users
in order to get weekly commits. This will  still work for larger samples of data'

usernamesforWeeklyCommits = usernames[1:60]
head(usernamesforWeeklyCommits)

#create data frame to store users and their repos
userIdAndRepo = c()
#get username and repo name and fill into vector
for(i in 1:length(usernamesforWeeklyCommits))
{
  repo =  content(GET(paste0("https://api.github.com/users/", usernamesforWeeklyCommits[i], "/repos"), gtoken))
  allrepos_R = jsonlite::fromJSON(jsonlite::toJSON(repo))
  names = c(allrepos_R$full_name)
  
  userIdAndRepo = c(userIdAndRepo , names)
  
  i=i+1
}
#remove duplicates
userIdAndRepo = unique(userIdAndRepo)
head(userIdAndRepo)
x = length(userIdAndRepo)*52
x
alluserdata =c()
ownerdata = c()
i=0
languages =c()
#add number of commits per week to vector
#also find how much of the commits each week are from the owner of the repository
#find which code is used most by byte size
for(i in 1: 10)
{
  getWeeklyCommit =  content(GET(paste0("https://api.github.com/repos/",userIdAndRepo[i],"/stats/participation"), gtoken))
  weeklyCommits = c(getWeeklyCommit$all)
  ownerWeeklyCommits = c(getWeeklyCommit$owner)
  ownerdata = c(ownerdata,ownerWeeklyCommits )
  alluserdata = c(alluserdata, weeklyCommits)
  getLanguages = content(GET(paste0("https://api.github.com/repos/",userIdAndRepo[i],"/languages"),gtoken))
  getLanguages
  languages = c(languages,getLanguages)
  languages2 <-cbind(userIdAndRepo[i],getLanguages)
  print(i)
  i=i+1
}

head(alluserdata)
languages2

write.csv(languages, file = "languagesTest.csv",row.names=FALSE)



