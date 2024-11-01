#### Preamble ####
# Purpose: Simulates a dataset of Australian electoral divisions, including the 
  #state and party that won each division.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)
library(dplyr)

#### Simulate data ####
# Set seed for reproducibility
set.seed(304)

# Simulate a dataset with 1000 observations
answers <- c("Harris", "Trump")
n <- 1000
simulated_data <- data.frame(
  sample_size = rpois(n, lambda = 1500),       # Sample size from a Poisson distribution
  pollscore = rnorm(n, mean = 0, sd = 1),      # Poll quality score from a normal distribution
  pct = rnorm(n, mean = 45, sd = 5),            # Support percentage around 45% with some variability
  answer = sample(answers, n, replace = TRUE))

# Introduce a relationship between predictors and `pct` (linear relationship)
simulated_data <- simulated_data %>%
  mutate(pct = 40 + 0.01 * sample_size + 2 * pollscore + rnorm(n, 0, 3))

# View the simulated data
head(simulated_data)



#### Save data ####
write_csv(simulated_data, "data/00-simulated_data/simulated_data.csv")
