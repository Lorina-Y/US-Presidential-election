#### Preamble ####
# Purpose: Simulates a dataset of US. election data
# Author: Lorina Yang, Ruiying Li
# Date: 4th November, 2024
# Contact: hanq.yang@mail.utoronto.ca and ruiying.li@mail.utoronto.ca
# License: N/A
# Pre-requisites: The `tidyverse` package must be installed

#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Simulate data ####
# Set seed for reproducibility
set.seed(304)

# Simulate a dataset with 1000 observations
pollsters <- c("YouGov", "TIPP", "Leger")
answers <- c("Harris", "Trump")
end_dates <- seq(as.Date("2024-09-01"), as.Date("2024-10-28"), by = "day")
n <- 1000
simulated_data <- data.frame(
  sample_size = rpois(n, lambda = 1500),# Sample size from a Poisson distribution
  pollscore = rnorm(n, mean = 0, sd = 1),   # Poll quality score from a normal distribution
  pct = rnorm(n, mean = 45, sd = 5),  # Support percentage around 45% with some variability
  answer = sample(answers, n, replace = TRUE),
  pollster = sample(pollsters, n, replace = TRUE),
  end_date = sample(end_dates, n, replace = TRUE)
  )

# Add candidate_dummy based on the answer column
simulated_data$candidate_dummy <- ifelse(simulated_data$answer == "Harris", 1, 0)

# View the simulated data
head(simulated_data)



#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")

