# GSoC 2021 Proposal
---
# Monte Carlo Integration
The goal of this project is to extent VolEsti’s functionality to handle multi-dimensional integrals. Under this project we are targeting to provide efficient implementations for various geometric random walk algorithms to sample points from convex polytopes and volume computation in high dimensions. In particular I have to implement a more advanced Monte Carlo Integration .

---
# *Easy*

Test: Easy: compile and run volesti. Read the CRAN package [documentation](https://cran.rstudio.com/web/packages/volesti/volesti.pdf), generate a random H-polytope and compute its volume.

- Compiled and ran volesti tests in C++ interface using cmake, make and ctest. Also installed all package dependencies like Rcpp, RcppEigen, BH etc and used devtools to install volesti Rcpp Package
- Generated a random H-polytope and computed its volume 

*Code*
```R
library(volesti)
P = gen_rand_hpoly(10, 50, generator = list(constants = "sphere"))
volumes <- list()
for (i in 1:10) {
volumes[[i]] <- volume(P) # default parameters
}
options(digits=10)
summary(as.numeric(volumes))
```

# *Medium*

Test: Use the R package [cubature](https://cran.r-project.org/web/packages/cubature/index.html) to compute the integral of f(x) = exp^{-a||x||^2} over the cube [-1,1]^n, for various values of a and dimension n until it crashes.

- Installed R package ``cubeture`` and used ``cubeture`` library to compute the integral of f(x) = exp^{-a||x||^2} over the cube [-1,1]^n.
- I tried varios values of a=[0,1,2,3] and the values of n incrementing by 1 stating from the number 1.
- At the value of n=24 the program got crashed due to the higher dimention used showing the result 0.
- Ovserving this we can say this package is way more less efficient than `volesti` package. using volesti approximation we can compute up to a few hundreds of dimensions. 

*Code*
```R

library(cubature) # load the package "cubature"
testFnWeb <- function(x) {
  exp(-a * sum(x^2))
}
hcubature(testFnWeb, rep(-1,n), rep(1,n), tol=1e-4)

```

# *Hard*

Test: Use volesti to approximate the same integrals as in previous test by [simple Monte Carlo](https://en.wikipedia.org/wiki/Monte_Carlo_integration) based on uniform sampling and by Importance Sampling using multivariate spherical Gaussian. Comment on the accuracy and run-time.

- Used library volesti to compute integral f(x) = exp^{-a||x||^2} till 100th dimension using uniform and gaussian sampling.
---
Observation of ``f(x) = exp^{-a||x||^2}``
- *Accuracy* : `cubature` is more accurate for small dimentations and it breaks easily for higher dimentions (n>=24). On otherside `volesti` perfectly works with a higher dimention with very less posibility of error.
- *Runtime* : Comparing upto 23rd dimention the runtime taken by `volesti` was definitely less then `cubature`.
 

*Code*
```R
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
plot(points[1,],points[2,])
                       

## SIMPLE MONTE CARLO USING GAUSSIAN DISTRIBUTION

P <- gen_cube(d,"H")

points = sample_points(P, n=10000 , distribution = list("density" = "gaussian", "variance" = 1)

plot(points[1,],points[2,])

```
