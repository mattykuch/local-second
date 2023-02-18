
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
  mutate(banana_quantity = case_when(species == "Adelie" & island == "Biscoe" ~ 1,
                                     species == "Adelie" & island == "Dream" ~ 0.5,
                                     species == "Adelie" & island == "Torgersen" ~ 0.1,
                                     TRUE ~ 1))
#Plot -----

ggplot(penguins, aes(x=bill_depth_mm, y=bill_length_mm, color = species)) +
  geom_point()