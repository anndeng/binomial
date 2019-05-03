context("Test summary functions")

test_that("aux_mean works as expected", {
  x <- 10
  y <- 0.3
  z <- 5
  
  expect_equal(aux_mean(x, y), 3)
  expect_equal(aux_mean(z, y), 1.5)
  expect_length(aux_mean(x, y), 1)
})

test_that("aux_mode works as expected", {
  x <- 10
  y <- 0.3
  z <- 5
  
  expect_equal(aux_mode(x, y), 3)
  expect_equal(aux_mode(z, y), 1)
  expect_length(aux_mode(x, y), 1)
})

test_that("aux_skewness works as expected", {
  x <- 10
  y <- 1
  z <- 0.5
  
  expect_equal(aux_skewness(x, y), -Inf)
  expect_equal(aux_skewness(x, z), 0)
  expect_length(aux_skewness(x, y), 1)
})

test_that("aux_kurtosis works as expected", {
  x <- 10
  y <- 1
  z <- 0.5
  
  expect_equal(aux_kurtosis(x, y), Inf)
  expect_equal(aux_kurtosis(x, z), -0.2)
  expect_length(aux_kurtosis(x, y), 1)
})