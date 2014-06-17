mixpanel <- function (key, secret, event = "Register", unit = "day", interval = 7, type = "unique") {
  library(RCurl)
  library(rjson)
  library(digest)
  library(httr)	
    
  ## Set the arguments
  expire <- as.integer(as.numeric(as.POSIXlt(Sys.time()))) + 900 ## Set the expiry time for the API link as 15 minutes
  event <- paste('["',event,'"]',sep="",collapse=NULL)
  
  
  args_sig <- paste('event=',event,"expire=",expire,"interval=",interval,"type=",type,"unit=",unit,sep="",collapse=NULL)
  args_url <- paste('event=',event,"&expire=",expire,"&interval=",interval,"&type=",type,"&unit=",unit,sep="",collapse=NULL)
  
  ## Create the hashed Signature
  sig <- paste("api_key=",key,args_sig,secret,sep="",collapse=NULL)
  hashed_sig <- digest(sig, algo="md5", serialize = FALSE)
  
  ## Create the URL with the full authorization string
  url <- paste("http://mixpanel.com/api/2.0/events/?","api_key=",key,"&",args_url,"&sig=",hashed_sig,sep="",collapse=NULL)
  
  ## Connect to the Mixpanel API and save data
  dataset <- fromJSON(content(GET(url), as = 'text'))
  assign("dataset",dataset,envir = .GlobalEnv)
}