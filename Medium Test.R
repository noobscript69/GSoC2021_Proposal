
#Editor:-Arnab Suklabaidya
#Date:-21/03/21


#installing all package dependencies
install.packages("Rcpp")
install.packages("RcppEigen")
install.packages("BH")
install.packages("lpSolveAPI")
install.packages("cubature")


#Using devtools to install volesti Rcpp Package
Rcpp::compileAttributes()  
library(devtools)  
devtools::build()  
devtools::install()  



#Rstudio as well to open volesti.Rproj and then click build source Package and then Install and Restart in Build at the menu bar.

#installing volesti package
install.packages("volesti")
library(volesti)



library(cubature) # load the package "cubature"
testFnWeb <- function(x) {
  exp(-a * sum(x^2))
}
hcubature(testFnWeb, rep(-1,n), rep(1,n), tol=1e-4)

