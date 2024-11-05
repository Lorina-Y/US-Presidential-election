#### Preamble ####
# Purpose: Tests the structure and validity of the analysis polling results data set
# Author: Lorina Yang, Ruiying Li
# Date: 4th November, 2024
# Contact: hanq.yang@mail.utoronto.ca and ruiying.li@mail.utoronto.ca
# License: N/A
# Pre-requisites: N/A

#### Workspace setup ####
library(tidyverse)
library(testthat)

analysis_data <- read_csv("data/02-analysis_data/analysis_data.csv")

# Check if data is loaded and is a data frame
test_that("Data loaded successfully", {
  expect_true(exists("analysis_data"))
  expect_true(is.data.frame(analysis_data))
})

# Test if the data was successfully loaded
if (exists("analysis_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}


#### Test data ####
# Test for no missing values
test_that("No missing values in the dataset", {
  expect_true(all(!is.na(analysis_data)))
})

# Check 'pct' is a numeric and falls between 0 and 100
test_that("'pct' values are between 0 and 100", {
  expect_true(all(analysis_data$pct >= 0 & analysis_data $pct <= 100))
})

# Check if the dataset has 7352 rows
if (nrow(analysis_data) == 7352) {
  message("Test Passed: The dataset has 7352 rows.")
} else {
  stop("Test Failed: The dataset does not have 7352 rows.")
}

# Check if the dataset has 7 columns
if (ncol(analysis_data) == 7) {
  message("Test Passed: The dataset has 7 columns.")
} else {
  stop("Test Failed: The dataset does not have 7 columns.")
}

# Verify if 'sample_size' column has only positive values
if (all(analysis_data$sample_size > 0)) {
  message("Test Passed: The 'sample_size' column contains only positive values.")
} else {
  stop("Test Failed: The 'sample_size' column contains non-positive values.")
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



