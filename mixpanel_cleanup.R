mixpanel_cleanup <- function (datasetname = "dataset", event = "Register") {
  ## Take the event values from the Mixpanel API imported list and turn them into a data frame
  dataloc <- paste(datasetname,"$data$values$",event,sep="",collapse=NULL)
  frame <- data.frame(eval(parse(text=dataloc)))
  
  ## Take the column names, remove the leading 'x' and add as a row for the date of the observation
  xnames <- colnames(frame)
  names = NULL
  for (i in 1:length(xnames)) {
    names[i] <- substring(xnames[i],2)
  }
  
  ## Transform and clean up the table, format dates properly, add correct column and row headings and order by date
  frame <- rbind(names, frame)
  frame <- data.frame(t(frame))
  colnames(frame) <- c("date", event)
  rownames(frame) <- c(1:nrow(frame))
  frame[,1] <- as.Date(frame$date, "%Y.%m.%d")
  frame <- frame[order(as.Date(frame$date, "%Y.%m.%d"), decreasing = TRUE),]
  frame <- frame[order(frame$date, decreasing=FALSE), ]
  
  ## Save this formatted data frame to the global environment
  df <- paste(event,"_frame",sep="",collapse=NULL)
  assign(df,frame,envir = .GlobalEnv)
}
