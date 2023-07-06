library(tidyverse)

library(betareg)

data.table(data("GasolineYield", package = "betareg"))
summary(GasolineYield)
colnames(GasolineYield)

betareg(formula = yield ~ batch + temp, data = GasolineYield)