#Load libraries

library(tidyverse)
library(palmerpenguins)

#baseplot

base_plot <- ggplot(data = penguins, aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(aes(color = species, shape = species), size=2) +
  scale_color_manual(values = c("darkorange", "darkorchid", "cyan4"))

base_plot