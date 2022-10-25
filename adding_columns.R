library(tidyr)
library(dplyr)
library(ggplot2)

data(mtcars)

mtcars <- mtcars %>%
  mutate(
    coolcars = (mpg+ hp+ cyl)/3
  )

mtcars$coolcars <- (mtcars$mpg + mtcars$hp + mtcars$cyl)/3