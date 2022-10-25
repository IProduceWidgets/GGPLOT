library(dplyr)

A <- starwars

B <- A %>% select(films)

typeof(B)


View(B)
B
unlist(head(B, 10) %>% slice(10))
head(B, 10)
