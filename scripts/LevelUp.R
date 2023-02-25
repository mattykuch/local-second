
#To get the code to work, first you’ll need to install a few packages…

# Here are the libraries we'll be using ----
# |- For creating our plot ----
install.packages("palmerpenguins")
install.packages("tidyverse")

# |- For tidying data ----
install.packages("janitor")

# |- For manipulating colours and adding text hierarchy ----
install.packages("monochromeR")

# |- For working with fonts ----
install.packages("ragg")

# |- For creating annotations ----
install.packages("ggtext")

# |- For taking a quick look at points we want to annotate ----
install.packages("plotly")

#Load tidyverse
library(tidyverse)

#Data -----

penguins <- palmerpenguins::penguins %>% 
  filter(!is.na(bill_length_mm)) %>%
  mutate(banana_quantity = case_when(species == "Adelie" & island == "Biscoe" ~ 1,
                                     species == "Adelie" & island == "Dream" ~ 0.5,
                                     species == "Adelie" & island == "Torgersen" ~ 0.1,
                                     TRUE ~ 1))
#Plot -----

basic_plot <- ggplot(penguins, aes(x=bill_depth_mm, y=bill_length_mm, color = species)) +
        geom_point(aes(alpha = banana_quantity)) + 
        scale_alpha(range = c(0.2, 1),
                    breaks = c(0.1, 0.5, 1)) +
        labs(title = "Banana loaf tastes best when baked with ripe or over-ripe bananas",
        subtitle = "The Palmer Penguins carried out an experiment using bananas of different ripeness.
The Adelie penguins were given unripe bananas, Gentoos were given over-ripe 
bananas and Chinstraps were given yellow bananas.
Each penguin was left to choose their own cooking time.",
       x = "Baking time",
       y = "Yumminess",
       caption = "Data from {palmerpenguins}; misused for illustration purposes.") +
  theme_minimal(base_size = 12)

basic_plot