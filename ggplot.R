## https://www.youtube.com/watch?v=HPJn1CMvtmI

library(tidyverse)

BOD # native R data

ggplot(data = BOD,
       mapping = aes(x = Time,
                     y = demand)
       )+
  geom_point(size = 5) + 
  geom_line(color = "red")

####

ggplot(BOD, aes(Time, demand))+
  geom_point(size = 5)+
  geom_line(color = "red")


####

CO2 %>% 
  ggplot(aes(conc, uptake,
             color = Treatment))+
  geom_point(size = 3, alpha = 0.5)+
  geom_smooth(method = lm, se =F)+
  facet_wrap(~Type)+
  labs(title = "Ceoncentration of CO2")+
  theme_bw()

####

CO2 %>%
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(alpha=.25)+
  theme_bw()

CO2 %>%
  ggplot(aes(Treatment, uptake))+
  geom_boxplot()+
  geom_point(aes(size = conc,
                 color = Plant),
             alpha = 0.5)+
  facet_wrap(~Type)+
  coord_flip()+
  theme_bw()

####

mpg %>%
  filter(cty < 25) %>%
  ggplot(aes(displ,cty))+
  geom_point(aes(color = drv,
                 size = trans),
             alpha = 0.5)+
  geom_smooth(method = lm)+
  facet_wrap(~year, nrow=1)+
  labs(x = "Engine size", y= "MPG in the city", title = "Fuel efficieny")+
  theme_bw()
  
  
