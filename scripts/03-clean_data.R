#### Preamble ####
# Purpose: Cleans the raw data about polls recorded
# Author: Lorina Yang, Ruiying Li
# Date: 4th November, 2024
# Contact: hanq.yang@mail.utoronto.ca and ruiying.li@mail.utoronto.ca
# License: N/A
# Pre-requisites: N/A

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("data/01-raw_data/president_polls.csv")


# Select wanted column:
cleaned_data <-
  raw_data |> select(
   pct, sample_size, pollster, answer, pollscore, end_date
  )

# Remove observations with N/A value
cleaned_data <-
  na.omit(cleaned_data)

# choose only observation with candidate "Trump" and "Harris"
cleaned_data <- cleaned_data %>%
  filter(answer %in% c("Harris", "Trump"))

# Convert 'answer' to a dummy variable
# Recode 'Harris' as 1 and 'Trump' as 0 in a new column 'candidate_dummy'
cleaned_data$candidate_dummy <- ifelse(cleaned_data$answer == "Harris", 1, 0)

# Ensure end_date columns are in date format
cleaned_data <- cleaned_data %>%
  mutate(
    end_date = parse_date_time(end_date, orders = c("mdy", "ymd"))
  )

# Convert 'end_date' from character to Date format
cleaned_data$end_date <- as.Date(cleaned_data$end_date)
head(cleaned_data)

# check how many count for each pollsters
table(cleaned_data$pollster)

head(cleaned_data)


#### Save data ####
write_csv(cleaned_data, "data/02-analysis_data/analysis_data.csv")

