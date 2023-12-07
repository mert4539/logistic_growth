#Script to estimate the model parameters using a linear approximation

install.packages("dplyr")
library(dplyr)

growth_data <- read.csv("/cloud/project/experiment1.csv")

#Case 1. K >> N0, t is small

data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))

model1 <- lm(N_log ~ t, data_subset1)
summary(model1)
# p<<<0.05 => significant.
# R^2=1 => 100% of the variability in population size is explained by the linear model above.
# The natural log of the initial population size (ln(N0)) is the intercept, and the growth rate (r) is the slope in this output.

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>2500)

model2 <- lm(N ~ 1, data_subset2)
summary(model2)
# The carrying capacity (K) estimate is the intercept in this output.
