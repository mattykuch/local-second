#Load libraries

library(tidyverse)
library(palmerpenguins)

#baseplot

base_plot <- ggplot(data = penguins, aes(x=flipper_length_mm, y=body_mass_g)) +
  geom_point(aes(color = species, shape = species), size=2) +
  scale_color_manual(values = c("darkorange", "darkorchid", "cyan4"))



#Styles, axes, grids

base_plot +
  scale_x_continuous(limits = c(170,240), 
                     labels = scales::label_number(suffix = "mm")) +
  scale_y_continuous(labels = scales::label_comma(suffix = "g"))