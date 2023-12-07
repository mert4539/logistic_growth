#Script to plot data and model

growth_data <- read.csv("/cloud/project/experiment1.csv")

# Creating a function to calculate N assuming logistic growth:
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 986.5074723094 #represented by the power of the log that equals the intercept value in the output of model1. 
  
r <- 0.0100086 # represented by the slope value in the output of model1.
  
K <- 60000000000 # represented by the intercept value in the output of model2.

# Plotting the logistic growth of E.coli population size:
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point()+

  scale_y_continuous(trans='log10')


