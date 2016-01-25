complete <- function(directory, id = 1:332) {
  files_list <- list.files(directory, full.names=TRUE)
  ret <- data.frame()
  for (id in id) {
    dat <- read.csv(files_list[id]) 
    ret <- rbind(ret, c(id, sum(complete.cases(dat))))
  }
  colnames(ret) <- c("id", "nobs")
  ret
}