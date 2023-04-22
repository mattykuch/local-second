# Load tidyverse and gganimate package
library(tidyverse)
library(gganimate)
library(gifski)

# Input the data
data <- data.frame(
  Country = rep(c("Uganda", "Kenya", "Tanzania", "Rwanda", "Burundi", "DRC"), each = 10),
  Year = rep(2009:2018, 6),
  HealthExpenditure = c(
    27, 31, 34, 35, 37, 38, 38, 39, 41, 43,
    34, 39, 48, 52, 60, 64, 69, 76, 85, 88,
    31, 32, 35, 39, 42, 46, 47, 51, 54, 57,
    37, 43, 46, 46, 51, 55, 60, 61, 64, 66,
    19, 19, 22, 23, 23, 25, 24, 23, 25, 26,
    17, 19, 22, 23, 24, 26, 27, 28, 28, 29
  )
)

# Create the animated line chart using ggplot2 and gganimate
animated_chart <- ggplot(data) +
  geom_line(aes(x = Year, y = HealthExpenditure, group = Country, color = Country, 
                size = ifelse(Country == "Uganda", 2, 1), alpha = ifelse(Country == "Uganda", 1, 0.4))) +
  geom_point(aes(x = Year, y = HealthExpenditure, group = Country, color = Country, 
                 size = ifelse(Country == "Uganda", 2, 1), alpha = ifelse(Country == "Uganda", 1, 0.4))) +
  labs(title = "Health Expenditure Per Capita (2009-2018)",
       x = "Year",
       y = "Health Expenditure (US Dollars)",
       color = "Country",
       size = "Country",
       alpha = "Country") +
  theme_minimal() +
  guides(size = FALSE, alpha = FALSE) +
  transition_reveal(Year)

# Render the animation
animation <- animate(animated_chart, nframes = 200, end_pause = 50, width = 800, height = 600, renderer = gifski_renderer())

# Save the animation as a GIF file
anim_save("animated_chart.gif", animation)