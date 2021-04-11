
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

myfunction <- function(x) {
  y = exp(-a *sum(x^2))

}

## SIMPLE MONTE CARLO USING UNIFORM DISTRIBUTION

P = gen_cube(d, 'H')
points = sample_points(P1, random_walk = list("walk" = "Baw"), n = 10000,
                        seed = 5)

## SIMPLE MONTE CARLO USING GAUSSIAN DISTRIBUTION

P <- gen_cube(d,"H")

points = sample_points(P, n=10000 , distribution = list("density" = "gaussian", "variance" = 1)


plot(points[1,],points[2,])


