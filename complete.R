setwd("D:/GitHub/rprog_assignment_1")
source("submitscript1.R")

complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  
  files_full <- list.files(directory, full.names = TRUE)
  
  id_list <- matrix(data=id, nrow = length(id), ncol = 1)
  
  nobs_list <- apply(id_list, 1, function(x) nrow(na.omit(read.csv(files_full[x]))))
  
  result <- data.frame(id=id_list, nobs=nobs_list)

  return(result)
}
