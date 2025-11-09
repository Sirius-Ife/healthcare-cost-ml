# scripts/utils.R

library(tidyverse)

read_data <- function(path = "data_raw/synthetic_health_data.csv"){
  if (!file.exists(path)) stop("Data file not found: ", path)
  read_csv(path, col_types = cols())
}

save_model <- function(model, path){
  saveRDS(model, path)
  message("Model saved to: ", path)
}
