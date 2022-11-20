# ParallelCoordinatesPlot

## Overview


ParallelCoordinatesPlot is a package, providing the Parallel Coordinates Plot.


## Installation

### Development version

To get a bug fix or to use a feature from the development version, you
can install the development version of dplyr from GitHub.

``` r
# install.packages("devtools")
devtools::install_github("wenrui2293/ParallelCoordinatesPlot")
```


## Usage

``` r
library(ParallelCoordinatesPlot)
data<-list(setosa=iris[iris$Species=="setosa","Sepal.Length"],
versicolor=iris[iris$Species=="versicolor","Sepal.Length"],
virginica=iris[iris$Species=="virginica","Sepal.Length"])
ParallelCoordinatesPlot(data,col=3)
```
