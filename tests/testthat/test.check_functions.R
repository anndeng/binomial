context("Test check functions")

test_that("check_prob works as expected", {
  x <- 0.5
  y <- 1.5
  
  expect_equal(check_prob(x), TRUE)
  expect_length(check_prob(x), 1)
  expect_error(check_prob(y))
})

test_that("check_trials works as expected", {
  x <- 0.5
  y <- 5
  z <- -1
  
  expect_error(check_trials(x))
  expect_length(check_trials(y), 1)
  expect_equal(check_trials(y), TRUE)
  expect_error(check_trials(z))
})

test_that("check_success works as expected", {
  x <- 2
  y <- 0.5
  z <- 5
  j <- 10
  k <- -1
  
  expect_error(check_success(k, z))
  expect_error(check_success(j, z))
  expect_error(check_success(y, z))
  expect_length(check_success(x, z), 1)
  expect_equal(check_success(x, z), TRUE)
})