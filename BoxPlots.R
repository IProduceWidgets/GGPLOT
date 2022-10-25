CollectedQueries %>%
  filter(Q %in% c("Air", "Water", "Land", "Animal", "Plants")) %>%
  ggplot(aes(y=Year, x=Q))+
  
  geom_boxplot(color = "Blue",
               fill = "dark grey",
               width = .5)+
  geom_violin(scale="count",
              color = NA,
              fill = "light blue",
              alpha=.9,
              width = 1.21
  )+
  stat_summary(fun.data = lengthUnique,
               geom = "text",
               fun = median
  )+
  #geom_line()+
  geom_hline(yintercept=2022, color="Red")+
  #theme_grey()
  labs(title = "World Scope: (# obs)",
       x = "Densities: Data-Years x Publication")
# annotate("text",
#          x = 1:length(Q),
#          y = aggregate(length(unique(InternalID)) ~ Q, FUN=median)
#          )



data(iris)

library(tidyverse)
library(dplyr)

A <- iris %>% 
  
  ggplot(aes(y=Sepal.Length, x=factor(Species)))+
  geom_boxplot()
A


