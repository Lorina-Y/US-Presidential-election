#### Preamble ####
# Purpose: Downloads and saves the data from [...UPDATE THIS...]
# Author: Rohan Alexander [...UPDATE THIS...]
# Date: 11 February 2023 [...UPDATE THIS...]
# Contact: rohan.alexander@utoronto.ca [...UPDATE THIS...]
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Download data ####

#### Read in the data ####
raw_elections_data <-
  read_csv(
    file = 
      "https://projects.fivethirtyeight.com/polls/data/president_polls.csv",
    show_col_types = TRUE,
    skip = 0
  )

# We have read the data from the website. We may like to save
# it in case something happens or they move it.




#### Save data ####
# [...UPDATE THIS...]
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(raw_elections_data, "data/01-raw_data/president_polls.csv") 
         
