
## ensure initillisation is run first


sizeOfRepo <-c()
watchers<-c()


i=1
while(i<1000)
{
  
  loopPaste<-paste0(usersUrl,"/",loginsName[i],"/repos")
  loopData=GET(loopPaste,gtoken)
  jsonLoop=content(loopData)
  loopDF=jsonlite::fromJSON(jsonlite::toJSON(jsonLoop))
  
  sizeRepo1 <- loopDF$size[[1]]
  watchersRepo1 <- loopDF$watchers[[1]]
  NumberOffollowers <- loopDF$followers
 print(sizeRepo1)
 print(watchersRepo1)
  sizeOfRepo <-c(sizeOfRepo,sizeRepo1)
  watchers <- c(watchers,watchersRepo1)
  
  
  watchersRepo1
  sizeRepo1
  
  
  
  print(paste0("getting user and details ", i))
  i=i+1
}


sizeOfRepo
write.csv(sizeOfRepo, file= "size.csv")
watchers
write.csv(watchers, file= "watchers.csv")







