#' Calculate the norm value for x
#'
#' @param x  The vector of numeric.
norm1 <- function(x) {
  #If the parameter x is character type, then convert to factor type.
  if (is.character(x)) x <- factor(x)
  #If the parameter x is factor type, then convert to integer type.
  if (is.factor(x)) x <- as.integer(x)
  #Throws an error if the parameter x is not of type numeric, or not all of type finite.
  if (!is.numeric(x) || !all(is.finite(x)))
    stop("All variables must finite numerics, factors or strings")
  #Calculate the difference between x and min(x)
  x <- x - min(x)
  #If at least one of x is greater than 0, then compute x/(max(x)-min(x))
  if (any(x > 0)) x / diff(range(x)) else x
}
#' Calculate the norm value of each element in the list data
#'
#' @param data  The list data.
normN <- function(data)
  #Calculate the norm value of each element in the list data
  lapply(data, norm1)

#' plots a simple Parallel Coordinates Plot
#'
#' @param data  The list data for plot.
#' @param col  The count of columns.
#' @param lwd  The line width.
#' @param lty  The line type.
#' @param ...  a list of tagged values.
#' @examples
#' data<-list(setosa=iris[iris$Species=="setosa","Sepal.Length"],
#' versicolor=iris[iris$Species=="versicolor","Sepal.Length"],
#' virginica=iris[iris$Species=="virginica","Sepal.Length"])
#' ParallelCoordinatesPlot(data,col=3)
#' @export
ParallelCoordinatesPlot <- function(data, col=2, lwd=1, lty=1, ...) {
  #If the parameter data is not of type list, throw an error
  if (!is.list(data))
    stop("`list' must be a list of variables!")
  #If the length of the parameter data is less than 2, then throw an error
  if (length(data) < 2)
    stop("Need at least two variables")
  #Calculate the norm value of each element in the list data
  data <- normN(data)
  #Calculate the length of each element in the list data
  n <- lengths(data)
  #N is the max length
  N <- max(n)
  #If the length of each element in the list data is different, then complete it according to the longest
  if (!all(n == N))
    data <- lapply(data,
                   function(x) rep(x, length.out=N))
  #Convert list data to matrix form
  m <- matrix(unlist(data), N)
  #Set the colnames of the matrix
  colnames(m) <- names(data)
  #plots a simple Parallel Coordinates Plot
  matplot(t(m), type='l', col=col, lwd=lwd, lty=lty, xlab='', ylab='', xaxt='n', yaxt='n', ...)
  abline(v = seq_along(data), col="#c0c0c0")
  axis(1, seq_along(data), names(data))
  invisible(data)
}
