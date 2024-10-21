#### Preamble ####
# Purpose: Cleans the raw plane data recorded by two observers..... [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 6 April 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)
#### Clean data ####
raw_data <- read_csv("data/01-raw_data/president_polls.csv")


# Select wanted column:
cleaned_data <-
  raw_data |> select(
   pct, sample_size, party, pollster, answer, transparency_score, pollscore, state
  )

# Remove observations with N/A value
cleaned_data <-
  na.omit(cleaned_data)

# Keep the top 6 most frequent appeared candidate name in "answer" variables
# Count the frequency of each candidate in the 'answer' column
candidate_count <- table(cleaned_data$answer)



# Identify the top 6 most frequent candidate names
top_candidates <- names(sort(candidate_count, decreasing = TRUE)[1:5])

# Filter the dataset to keep only rows with the top 5 candidate names
cleaned_data <- cleaned_data[cleaned_data$answer %in% top_candidates, ]


#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")

