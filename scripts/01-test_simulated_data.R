#### Preamble ####
# Purpose: Tests the structure and validity of the simulated data
# Author: Lorina Yang, Ruiying Li
# Date: 4th November, 2024
# Contact: hanq.yang@mail.utoronto.ca and ruiying.li@mail.utoronto.ca
# License: N/A
# Pre-requisites: N/A


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

# Verify if 'end_date' column contains only dates within the specified range
start_date <- as.Date("2024-09-01")
end_date <- as.Date("2024-10-28")
if (all(analysis_data$end_date >= start_date & analysis_data$end_date <= end_date)) {
  message("Test Passed: The 'end_date' column contains dates within the expected range.")
} else {
  stop("Test Failed: The 'end_date' column contains dates outside the expected range.")
}

# Verify if 'sample_size' column has only positive values
if (all(analysis_data$sample_size > 0)) {
  message("Test Passed: The 'sample_size' column contains only positive values.")
} else {
  stop("Test Failed: The 'sample_size' column contains non-positive values.")
}

# Check if the dataset has 1000 rows
if (nrow(analysis_data) == 1000) {
  message("Test Passed: The dataset has 1000 rows.")
} else {
  stop("Test Failed: The dataset does not have 1000 rows.")
}

# Check if the dataset has 7 columns
if (ncol(analysis_data) == 7) {
  message("Test Passed: The dataset has 7 columns.")
} else {
  stop("Test Failed: The dataset does not have 7 columns.")
}


# Check if 'pct' column values fall within a realistic range (e.g., 0 to 100%)
if (all(analysis_data$pct >= 0 & analysis_data$pct <= 100)) {
  message("Test Passed: The 'pct' column values are within a realistic range.")
} else {
  stop("Test Failed: The 'pct' column has values outside the realistic range (0-100).")
}

# Check if 'pollster' column has only valid pollster names
valid_pollsters <- c("YouGov", "TIPP", "Leger")
if (all(analysis_data$pollster %in% valid_pollsters)) {
  message("Test Passed: The 'pollster' column contains only valid pollster names.")
} else {
  stop("Test Failed: The 'pollster' column contains invalid pollster names.")
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



