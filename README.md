# Modelling E.coli population growth

## Description
The goal of this analysis is to model the population growth of E.coli bacteria. More specifically, the project estimates the initial population size (N), the growth rate (r), and the carrying capacity (K) in a reproducible manner. This is done using two linear models: during the initial stages of growth, the population size (N) grows exponentially, so N has to be log-transformed before a linear model can be fitted to this part of the data. During the later stages of growth, resource abundance decerases, so the population size remains constant, and can hence directly be described using a linear model (no transformations required). The population growth parameters estimated by the models are then plotted against the raw data. The analysis is carried out in R scripts on Posit cloud, and subsequently pushed to GitHub.

## Repo content overview

* README.md
* LICENSE - details regarding collaborator rights
* package-versions.txt - record of the packages used
* plot_data.R - plotting the data from experiment 1
* Rplot1.pdf - growth plot with absolute values on both x and y axis (logistic)
* Rplot2.pdf - growth semilog plot with absolute values on x axis and log transformed values on y axis (linear)
* fit_linear_model.R - fitting linear model to estimate model parameters
* plot_data_and_model.R - plotting the model predictions against the raw data

## Results

During the initial stages of growth, the linear model relating time (t) to the log of the population size (lnN) explains 100% of the variability in the population size. The results are highly significant, with the p-value well below the apriori chosen threshold of 0.05. We can use the output from the summary function of this model to extract the estimate for the log of the initial population size: ln(N0) = 6.8941709. Therefore, N0 = e^6.8941709 = 986.5075. We can also infer the estimate for the growth rate (r), since this is the slope of the line: r = 0.0100086.  

During the later stages of growth, when resources are depleted, the population size is constant. This means that the corresponding linear model has no slope, only an intercept. The value of this intercept represents the carrying capacity: K = 6x10^10 = 60 000 000 000.  

Data used: experiment1.csv

## References


## Acknowledgements
José Gabriel Niño Barreat

## License
This project is licensed under the MIT license.
