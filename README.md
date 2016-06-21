# Goal
- We want to create ishigami function in scilab (ishigami.sce) and then call sobol function on this function by creating an adapter with scilab API and Rcpp.

# R Studio
- activate Rcpp library
- setwd() to this directory
- sourceCpp("R.cpp") (should be externalized since we want to compile against R and scilab APIs at same time)

# Scilab
- make scilab

# Both
- Rscript sobol.R
