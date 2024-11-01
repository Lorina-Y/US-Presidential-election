#### Preamble ####
# Purpose: Tests... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 26 September 2024 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)


analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####

# Check if the dataset has 5942 rows
if (nrow(analysis_data) == 5942) {
  message("Test Passed: The dataset has 5942 rows.")
} else {
  stop("Test Failed: The dataset does not have 5942 rows.")
}

# Check if the dataset has 9 columns
if (ncol(analysis_data) == 9) {
  message("Test Passed: The dataset has 9 columns.")
} else {
  stop("Test Failed: The dataset does not have 9 columns.")
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



