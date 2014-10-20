setwd("D:/GitHub/rprog_assignment_1")
source("submitscript1.R")

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  source("complete.R")
  
  
  files_full <- list.files(directory, full.names = TRUE)
  
  all_data <- complete("specdata", 1:332)
  
  clean_data <- subset(all_data, NOBS > threshold , select=c(ID, NOBS))
  file_id_list <- clean_data[1]
  
  file_id_matrix <- data.matrix(file_id_list)
  
  if(length(file_id_matrix) != 0) {
    corr_list <- apply(file_id_matrix, 1, function(x) cor(na.omit(read.csv(files_full[x]))[2], na.omit(read.csv(files_full[x]))[3]))
    
    return(corr_list)
  }
  else{
    return(vector(mode="numeric", length=0))
  }
  
}