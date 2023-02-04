# Get the Data

# Read in with tidytuesdayR package 
# Install from CRAN via: 

install.packages("tidytuesdayR")

#libraries
library(tidyverse)
library(tidytuesdayR)
library(scales)


# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

# tuesdata <- tidytuesdayR::tt_load('2021-02-09')

tuesdata <- tidytuesdayR::tt_load(2021, week = 7)

#Testing out the dataset
tuesdata
tuesdata$lifetime_earn

#Make one chart for each dataset to get a feel for what is possible

#Dataset 1 - Average Life time earnings by Race and Gender

lifetime_earn_tbl <- tuesdata$lifetime_earn

lifetime_earn_tbl %>% ggplot(aes(lifetime_earn, race, fill=gender)) + 
                      geom_col(position = "dodge") +
                      scale_x_continuous(labels = dollar)
#Dataset 2 - Student Debt
tuesdata$student_debt -> student_debt_tbl

#Chart 2.1
student_debt_tbl %>% ggplot(aes(year, loan_debt_pct, color=race )) +
                    geom_line() +
                    expand_limits(y=0) +
                    scale_y_continuous(labels = percent) +
                    labs(y = "% of families with student loan debt")
#Chart 2.2

student_debt_tbl %>% ggplot(aes(year, loan_debt, color=race )) +
  geom_line() +
  expand_limits(y=0) +
  scale_y_continuous(labels = dollar) +
  labs(y = "Average loan debt")

