# data/generate_synthetic_data.R

library(tidyverse)
library(lubridate)
set.seed(12345)

n <- 20000  # number of synthetic members

member_id <- sprintf("M%06d", 1:n)
age <- sample(18:85, n, replace = TRUE)
sex <- sample(c("Female","Male","Other"), n, replace = TRUE, prob = c(0.51,0.48,0.01))
region <- sample(c("West","East","North","South","Central"), n, replace = TRUE)
employer_id <- sample(sprintf("E%03d", 1:500), n, replace = TRUE)

# Age-related chronic condition probabilities

p_hyper <- plogis((age - 50)/10) * 0.3
p_diab  <- plogis((age - 55)/12) * 0.2

hypertension <- rbinom(n,1,p_hyper)
diabetes     <- rbinom(n,1,p_diab)
asthma       <- rbinom(n,1,0.08)
is_chronic   <- as.integer((hypertension + diabetes + asthma) > 0)

# Utilization

previous_visits <- rpois(n, lambda = 1 + 0.03*(age-30) + 1.5*is_chronic)
telemedicine_visits <- rpois(n, lambda = 0.5 + 0.6*(runif(n) < 0.25))
prev_year_cost <- round(rlnorm(n, meanlog = 8 + 0.8*is_chronic + 0.01*(age-50), sdlog = 1.1))

distinct_providers <- pmin(12, 1 + rpois(n, lambda = 0.2 * previous_visits + 0.5))
num_prescriptions <- rpois(n, lambda = 0.5 + 1.2*is_chronic)

has_preventive_visit <- rbinom(n,1,prob = pmin(0.85, 0.55 - 0.002*(age-30) + 0.22*runif(n)))
adherence_index <- pmin(1, pmax(0, rbeta(n, 2 + 2*has_preventive_visit, 4)))

# Next-period cost generation (signal + non-linear effects + noise)

base_cost <- 200 + 2*(age - 30) + 1000*is_chronic + 50*previous_visits +
             160*telemedicine_visits + 450*distinct_providers + 40*num_prescriptions
base_cost <- base_cost + 0.05 * pmax(prev_year_cost - 10000, 0)
next_period_cost <- round(rlnorm(n, meanlog = log(pmax(50, base_cost)), sdlog = 0.8))

# Define high-cost flag = top 10% by cost

high_cost_threshold <- quantile(next_period_cost, 0.90)
high_cost_flag <- as.integer(next_period_cost >= high_cost_threshold)

synthetic <- tibble(
  member_id, age, sex, region, employer_id,
  hypertension, diabetes, asthma, is_chronic,
  previous_visits, telemedicine_visits, prev_year_cost,
  distinct_providers, num_prescriptions, has_preventive_visit,
  adherence_index, next_period_cost, high_cost_flag
)

dir.create("data_raw", showWarnings = FALSE)
write_csv(synthetic, "data_raw/synthetic_health_data.csv")
message("Synthetic data written to data_raw/synthetic_health_data.csv (n = ", n, ")")
