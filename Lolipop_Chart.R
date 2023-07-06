library(tidyverse)
library(ggplot2)

# Sample data

set.seed(1000)

DATA <- data.frame(x = LETTERS[1:10],
                   y = sample(20:35, 10, replace = T),
                   z = sample(1:10, 10, replace = T))

# Data manipulations


# Sample plots

DATA %>% ggplot(aes(x=x, y=y)) +
  geom_segment(aes(x = x, xend = x, y = 0, yend = y),
               color = "grey", lwd = 1.5) +
  geom_point(size = 7, pch = 21, bg = 4, col = 1) +
  geom_text(aes(label = z), color = "white", size = 3)


  