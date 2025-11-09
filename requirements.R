# requirements.R

packages <- c(
  "tidyverse", "lubridate", "janitor", "skimr", "GGally",
  "caret", "rsample", "recipes", "yardstick", "vip",
  "randomForest", "xgboost", "glmnet", "fastshap",
  "DALEX", "rmarkdown", "knitr"
)

install_if_missing <- function(pkgs){
  for (p in pkgs) {
    if (!requireNamespace(p, quietly = TRUE)) {
      install.packages(p, dependencies = TRUE)
    }
  }
}
install_if_missing(packages)
message("Required packages installed (or already present).")
