library(tidyverse)
library(ggplot2) # this is inside tidyverse 
library(treemapify)

G20

G20 %>%
  slice(rep(c(1:20), 20)) %>%
  ggplot(aes(area=gdp_mil_usd, fill=region, subgroup=region))+
  geom_treemap(
    show.legend=F
    )+
  geom_treemap_subgroup_border(color="lightgrey", size=5, 
                               show.legend=F
                               )+
  scale_fill_brewer(palette = "Set3")







#####

G20 %>% 
  ggplot(aes(area = Contig_Len, fill = Genome_Name, subgroup = Genome_Name)) +
  geom_treemap(show.legend = FALSE) +
  geom_treemap_subgroup_border(colour = "white", size = 5) +
  scale_fill_brewer(palette = "Set3")