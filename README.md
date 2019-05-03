<!-- README.md is generated from README.Rmd. Please edit that file -->
Overview
--------

`"binomial"` is a package that provides functions to summarize and visualize binomial distributions.

-   `bin_variable()` creates a binvar object (of class `"binvar"`)
-   `print.binvar()` method for a `"binvar"` object to print content
-   `summary()` and `print.summary()` method for a `"binvar"` object

-   `bin_mean()`, `bin_variance()`, `bin_mode()`, `bin_skewness()`, and `bin_kurtosis()` to calculate summary measures for given trials and probability

-   `bin_choose()` calculates number of combinations in which *k* successes can occur in *n* trials
-   `bin_probability()` calculates probability of obtaining given number of successes in trials
-   `bin_distribution()` creates an object of both `"bindis"` and `"data.frame"` classes that tabulates the probability of obtaining given number of successes in trials
-   `plot()` method for a `"bindis"` object to plot barchart of probabilities
-   `bin_cumulative()` creates an object of both `"bincum"` and `"data.frame"` classes that tabulates cumulative probability of obtaining given number of successes in trials
-   `plot()` method for a `"bincum"` object to plot cumulative probability

Motivation
----------

This package has been developed for Stat133, Sp2019 as an exercise in making packages.

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 
# install "cointoss" (without vignettes)
devtools::install_github("anndeng/binomial")
#> Skipping install of 'binomial' from a github remote, the SHA1 (3be41f0b) has not changed since last install.
#>   Use `force = TRUE` to force installation
# install "cointoss" (with vignettes)
devtools::install_github("anndeng/binomial", build_vignettes = TRUE)
#> Skipping install of 'binomial' from a github remote, the SHA1 (3be41f0b) has not changed since last install.
#>   Use `force = TRUE` to force installation
```

Usage
-----

``` r
library(binomial)
# make binomial random variable object
binvar1 <- bin_variable(5, 0.5)
# mode of binvar with 10 trials, 0.5 prob of success
bin_mode(10, 0.5)
#> [1] 5
# combinations of 2 successes in 5 trials
bin_choose(5, 2)
#> [1] 10
# probability of 2 successes in 5 trials, 0.5 prob of success
bin_probability(2, 5, 0.5)
#> [1] 0.3125
# probability distribution of 5 trials, 0.5 prob of success
bin_distribution(5, 0.5)
#> Warning in if (success < 0) {: the condition has length > 1 and only the
#> first element will be used
#> Warning in if (success%%1 != 0) {: the condition has length > 1 and only
#> the first element will be used
#> Warning in if (success >= trials) {: the condition has length > 1 and only
#> the first element will be used
#> Warning in if ((k > n) == TRUE) {: the condition has length > 1 and only
#> the first element will be used
#>   successes probability
#> 1         0     0.03125
#> 2         1     0.15625
#> 3         2     0.31250
#> 4         3     0.31250
#> 5         4     0.15625
#> 6         5     0.03125
# cumulative probability of 5 trials, 0.5 prob of success
bin_cumulative(5, 0.5)
#> Warning in if (success < 0) {: the condition has length > 1 and only the
#> first element will be used
#> Warning in if (success%%1 != 0) {: the condition has length > 1 and only
#> the first element will be used
#> Warning in if (success >= trials) {: the condition has length > 1 and only
#> the first element will be used
#> Warning in if ((k > n) == TRUE) {: the condition has length > 1 and only
#> the first element will be used
#>   successes probability cumulative
#> 1         0     0.03125    0.03125
#> 2         1     0.15625    0.18750
#> 3         2     0.31250    0.50000
#> 4         3     0.31250    0.81250
#> 5         4     0.15625    0.96875
#> 6         5     0.03125    1.00000
```
