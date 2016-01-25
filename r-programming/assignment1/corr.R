corr <- function(directory, threshold = 0) {
  files_list <- list.files(directory, full.names=TRUE)
  ret <- numeric()
  for (file in files_list) {
    dat <- read.csv(file) 
    complete <- sum(complete.cases(dat))
    if ( complete <= threshold) next
    ret <- c(ret, cor(x=dat$sulfate, y= dat$nitrate, use="complete.obs"))
  }
  ret
}