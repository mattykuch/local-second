# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: 

install.packages("tidytuesdayR")

#Other libraries
library(tidyverse)
library(tidytuesdayR)
library(scales)


# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

# tuesdata <- tidytuesdayR::tt_load('2021-02-09')

tuesdata <- tidytuesdayR::tt_load(2021, week = 7)

tuesdata
tuesdata$income_time

lifetime_earn <- tuesdata$lifetime_earn