pollutantmean <- function(directory, pollutant, id = 1:332) {
  files_list <- list.files(directory, full.names=TRUE)
  dat <- data.frame()
  for (id in id) {
    dat <- rbind(dat, read.csv(files_list[id]))
  }
  mean(dat[, pollutant], na.rm=TRUE)
}
