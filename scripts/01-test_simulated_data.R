#### Preamble ####
# Purpose: Tests the structure and validity of the simulated Australian 
  #electoral divisions dataset.
# Author: Rohan Alexander
# Date: 26 September 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: 
  # - The `tidyverse` package must be installed and loaded
  # - 00-simulate_data.R must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj


#### Workspace setup ####
library(tidyverse)

analysis_data <- read_csv("data/00-simulated_data/simulated_data.csv")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 1000 rows
if (nrow(analysis_data) == 1000) {
  message("Test Passed: The dataset has 1000 rows.")
} else {
  stop("Test Failed: The dataset does not have 1000 rows.")
}

# Check if the dataset has 4 columns
if (ncol(analysis_data) == 4) {
  message("Test Passed: The dataset has 4 columns.")
} else {
  stop("Test Failed: The dataset does not have 4 columns.")
}


# Check if the 'answer' column contains only 'Harris' and 'Trump"
valid_answers <- c("Harris", "Trump")

if (all(analysis_data$answer %in% valid_answers)) {
  message("Test Passed: The 'answer' column contains only 'Harris' and 'Trump'.")
} else {
  stop("Test Failed: The 'answer' column contains invalid candidates names.")
}


# Check if there are any missing values in the dataset
if (all(!is.na(analysis_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'answer' columns
if (all(analysis_data$answer != "")) {
  message("Test Passed: There are no empty strings in 'answer'.")
} else {
  stop("Test Failed: There are empty strings in answer columns.")
}

# Check if the 'answer' column has at least two unique values
if (n_distinct(analysis_data$answer) >= 2) {
  message("Test Passed: The 'answer' column contains at least two unique values.")
} else {
  stop("Test Failed: The 'answer' column contains less than two unique values.")
}

