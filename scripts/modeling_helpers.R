# scripts/modeling_helpers.R

library(tidyverse)
library(yardstick)
library(ggplot2)

regression_metrics <- function(truth, estimate){
  tibble(
    RMSE = yardstick::rmse_vec(truth = truth, estimate = estimate),
    MAE  = yardstick::mae_vec(truth = truth, estimate = estimate),
    R2   = yardstick::rsq_vec(truth = truth, estimate = estimate)
  )
}

plot_feature_importance <- function(vip_obj, top = 15, title = "Variable importance"){
  vip_obj %>% vip::vip(num_features = top) + ggtitle(title)
}
