#### Preamble ####
# Purpose: Downloads and saves the data from the website FiveThirtyEight
# Author: Lorina Yang, Ruiying Li
# Date: 4th November, 2024
# Contact: hanq.yang@mail.utoronto.ca and ruiying.li@mail.utoronto.ca
# License: N/A
# Pre-requisites: N/A

#### Workspace setup ####
library(tidyverse)

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
# change the_raw_data to the name I assigned when I downloaded it.
write_csv(raw_elections_data, "data/01-raw_data/president_polls.csv") 
         
