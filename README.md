# Modelling E.coli population growth

# QUESTION 1:  
## Description
The goal of this analysis is to model the population growth of E.coli bacteria. More specifically, the project estimates the initial population size (N0), the growth rate (r), and the carrying capacity (K) in a reproducible manner. This is done using two linear models: during the initial stages of growth, the population size (N) grows exponentially, so N has to be log-transformed before a linear model can be fitted to this part of the data to estimate N0 and r. During the later stages of growth, resource abundance decreases, so the population size remains constant, and can hence directly be described using a linear model with just an intercept (no transformations required). This second model is used to estimate K. The population growth predictions based on the models are then plotted against the raw data. The analysis is carried out in R scripts on Posit cloud, and subsequently pushed to GitHub.

## Repo content overview

* README.md
* LICENSE - details regarding collaborator rights
* package-versions.txt - record of the packages used
* plot_data.R - plotting the data from experiment 1
* fit_linear_model.R - fitting linear model to estimate model parameters
* plot_data_and_model.R - plotting the model predictions against the raw data
* question3.R - code for making a plot comparing logistic and exponential growth
* Rplot1.pdf - growth plot with absolute values on both x and y axis (logistic)
* Rplot2.pdf - growth semilog plot with absolute values on x axis and log transformed values on y axis (linear)
* Rplot3.pdf - plot comparing logistic vs exponential growth from question3.R

## Results

During the initial stages of growth, the linear model relating time (t) to the log of the population size (lnN) explains 100% of the variability in the population size. The results are highly significant, with the p-value well below the apriori chosen threshold of 0.05. We can use the output from the summary function of this model to extract the estimate for the log of the initial population size: ln(N0) = 6.8941709. Therefore, N0 = e^6.8941709 = 986.5075. We can also infer the estimate for the growth rate (r), since this is the slope of the line: r = 0.0100086.  

During the later stages of growth, when resources are depleted, the population size is constant. This means that the corresponding linear model has no slope, only an intercept. The value of this intercept represents the carrying capacity: K = 6x10^10 = 60 000 000 000.  

Data used: experiment1.csv   

## Acknowledgements
José Gabriel Niño Barreat

## License
This project is licensed under the MIT license.

# QUESTION 2:  

* Use your estimates of N0 and r to calculate the population size at t = 4980 min, assuming that the population grows exponentially. How does it compare to the population size predicted under logistic growth?  

If we assume that the population grows exponentially even at t = 4980, then the population size at that timepoint can be described by the following equation: N(t) = N0 x e^(rt). Using the estimates N0 = 986.5075 and r = 0.0100086, we can calculate: N(4980) = 986.5075 x e^(0.0100086 x 4980) = 4.37 x 10^24.  

However, given that resources become depleted overtime, it is likely that at timepoint t = 4980 the population size will be constant, rather than staying exponential. Under logistic growth, the predicted population size at that timepoint would be described by the following equation: N(t) = [K x N0 x e^(rt)] / [K – N0 + N0 x e^(rt)]. Using the estimates N0 = 986.5075, r = 0.0100086 and K = 60 000 000 000, we can calculate: N(4980) = [6 x 10^10 x 986.5075 x e^(0.0100086 x 4980)] / [6x10^10 – 986.5075 + 986.5075 x e^(0.0100086 x 4980)] = [2.6225 x 10^35] / [4.3708 x 10^24] = 60 000 000 137 = 6 x 10^10.  

Unsurprisingly, the exponential growth estimate is much larger than the logistic growth estimate. More specifically, if the bacterial population was continuing to grow exponentially at t = 4980, its population size would be [4.37x10^24]/[6x10^10] = 7.28 x 10^13 times larger than what was actually observed in the experiment.  

# QUESTION 3:  

![Q3_Rplot](https://github.com/tgbhujm/logistic_growth/assets/150151014/a8bd46da-4287-493e-8c46-f10f439b0b37)  

NOTE: The y-axis is log10-transformed (as indicated by the y-axis tick marks), so that is why the exponential line appears linear.

