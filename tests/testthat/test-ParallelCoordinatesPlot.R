test_that("norm1 test", {
  expect_equal(norm1(c("1","2")), c(0,1))
  expect_equal(norm1(c(1,2)), c(0,1))
  expect_equal(norm1(c(1,1,1)), c(0,0,0))
  try(norm1(list(a=c(1.1,2.1,T,NA,Inf)),silent=TRUE))
})
test_that("normn test", {
  expect_equal(normN(list(a=c(1,2),b=c(2,4))), list(a=c(0,1),b=c(0,1)))
})
test_that("ParallelCoordinatesPlot test", {
  try(ParallelCoordinatesPlot(list(setosa=iris[iris$Species=="setosa","Sepal.Length"],versicolor=iris[iris$Species=="versicolor","Sepal.Length"])), silent=TRUE)
  try(ParallelCoordinatesPlot(list(setosa=iris[iris$Species=="setosa","Sepal.Length"],versicolor=iris[iris$Species=="versicolor","Sepal.Length"][-1])), silent=TRUE)
  try(ParallelCoordinatesPlot(list(setosa=iris[iris$Species=="setosa","Sepal.Length"])), silent=TRUE)
  try(ParallelCoordinatesPlot(c(1,2)), silent=TRUE)
})
