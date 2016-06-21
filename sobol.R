library("Rcpp") #load Rcpp
library("sensitivity") #load sensitivity package for SOBOL
sourceCpp("ishigami.cpp") #create ishigami R function from scilab code by using Scilab API
x1 <- sobol(model = ishigami.fun, X1 = X1, X2 = X2, order = 2, nboot = 100) #sobol with ishigami from sensitivity package
x2 <- sobol(model = ishigami, X1 = X1, X2 = X2, order = 2, nboot = 100) #sobol with ishigami from scilab
# normally, x1 and x2 should lead to same conclusion.
