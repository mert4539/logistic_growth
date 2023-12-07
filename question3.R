#Loading required packages:
library(ggplot2)

#Loading the data from experiment 1:
growth_data <- read.csv("/cloud/project/experiment1.csv")

#Creating a function to calculate N assuming logistic growth:
logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

#Creating a function to calculate N assuming exponential growth:
expon_fun <- function(t) {
  
  N <- N0*exp(r*t)
  
  return(N)
  
}

#Inputing the estimated values of the parameters: 
N0 <- 986.5074723094

r <- 0.0100086

K <- 60000000000

#Plot comparing logistic growth curve (red),
#exponential growth curve (blue),
#and the actual data (black points):
ggplot(aes(t,N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_function(fun=expon_fun, colour = "blue") +
  
  geom_point(size = 0.2)+
  
  labs(title = "Logistic vs exponential growth of an E.coli population",
       
       x = "\nTime (t)",
       
       y = "Population size (N)\n")+
  
  theme_bw()+
  
  scale_y_continuous(trans='log10')

