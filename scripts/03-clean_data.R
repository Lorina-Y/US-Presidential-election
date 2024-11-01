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
   pct, sample_size, pollster, answer, pollscore, methodology, end_date
  )

# Remove observations with N/A value
cleaned_data <-
  na.omit(cleaned_data)

# Keep the top 6 most frequent appeared candidate name in "answer" variables
# Count the frequency of each candidate in the 'answer' column
candidate_count <- table(cleaned_data$answer)

# # Identify the top 2 most frequent candidate names: "Trump" and "Biden"
# top_candidates <- names(sort(candidate_count, decreasing = TRUE)[1:3])
# 
# # Filter the dataset to keep only rows with the top 5 candidate names
# cleaned_data <- cleaned_data[cleaned_data$answer %in% top_candidates, ]
# head(cleaned_data)

# choose only observation with candidate "Trump" and "Harris"
cleaned_data <- cleaned_data %>%
  filter(answer %in% c("Harris", "Trump"))

# Convert 'answer' to a dummy variable
# Recode 'Harris' as 1 and 'Trump' as 0 in a new column 'candidate_dummy'
cleaned_data$candidate_dummy <- ifelse(cleaned_data$answer == "Harris", 1, 0)
head(cleaned_data)

# Ensure end_date columns are in date format
cleaned_data <- cleaned_data %>%
  mutate(
    end_date = parse_date_time(end_date, orders = c("mdy", "ymd"))
  )

# Convert 'end_date' from character to Date format
cleaned_data$end_date <- as.Date(cleaned_data$end_date)
head(cleaned_data)

# Define Election Day
election_day <- as.Date("2024-11-05")

# Calculate days until Election Day
cleaned_data$days_until_election <- as.numeric(difftime(election_day, cleaned_data$end_date, units = "days"))

# check how many count for each pollsters
table(cleaned_data$pollster)

# # Remove polls with pollster counts less than 6
# cleaned_data <- cleaned_data %>%
#   group_by(pollster) %>%
#   filter(n() >= 6) %>%
#   ungroup()

head(cleaned_data)

# # Aggregate by pollster and candidate, calculating average support
# pollster_data <- cleaned_data %>%
#   group_by(pollster, answer) %>%
#   summarise(
#     avg_support = mean(pct, na.rm = TRUE),
#     avg_sample_size = mean(sample_size, na.rm = TRUE),
#     avg_pollscore = mean(pollscore, na.rm = TRUE),
#     primary_methodology = first(methodology)
#   )

# # Check the pollster-based aggregated data
# head(pollster_data)



#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")

