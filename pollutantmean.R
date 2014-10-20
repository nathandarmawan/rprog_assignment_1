setwd("D:/GitHub/rprog_assignment_1")
source("submitscript1.R")
## source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
    
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  files_full <- list.files(directory, full.names = TRUE)
  
  dat <- data.frame()
  for (i in id) {
    dat <- rbind(dat, read.csv(files_full[i]))
  }
  result <- mean(dat[, pollutant], na.rm=TRUE) 
  
  return(result) 
}