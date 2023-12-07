#Script to plot the logistic growth data

growth_data <- read.csv("/cloud/project/experiment1.csv")

library(ggplot2)

# Plotting the population size over time:
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  theme_bw()

# Plotting the log-transformed population size over time:
ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("t") +
  
  ylab("y") +
  
  scale_y_continuous(trans='log10')

# Extracting the information for the packages used:
sink(file = "package-versions.txt")
sessionInfo()
sink()
