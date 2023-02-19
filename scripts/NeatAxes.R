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
  scale_y_continuous(labels = scales::label_comma(suffix = "g")) + 
  theme(
    panel.background = element_blank(),
    panel.grid.major = element_line(color = "#e7e7e7",size = 0.4),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "#e7e7e7",size = 0.8,
                             arrow = arrow(length = unit(2, "mm")))
    
  )