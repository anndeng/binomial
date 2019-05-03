context("Test binomial functions")

test_that("bin_choose works as expected", {
  x <- 5
  y <- 2
  z <- 6

  expect_equal(bin_choose(x, y), 10)
  expect_error(bin_choose(x, z))
  expect_equal(bin_choose(z, y), 15)
})

test_that("bin_probability works as expected",{
  x <- 0
  y <- 2
  z <- 3
  j <- 0.5

  expect_equal(bin_probability(x, z, j), 0.125)
  expect_equal(bin_probability(y, z, j), 0.375)
  expect_error(bin_probability(z, y, j))
})

test_that("bin_distribution works as expected", {
  x <- 3
  y <- 0.5
  j <- -2
  k <- -0.5
  df <- data.frame(c(0, 1, 2, 3), c(0.125, 0.375, 0.375, 0.125))
  colnames(df) <- c("successes", "probability")
  class(df) <- c("bindis", "data.frame")

  expect_equal(bin_distribution(x, y), df)
  expect_error(bin_distribution(j, y))
  expect_error(bin_distribution(x, k))
})

test_that("bin_cumulative works as expected", {
  x <- 3
  y <- 0.5
  j <- -2
  k <- -0.5
  df <- data.frame(c(0, 1, 2, 3), c(0.125, 0.375, 0.375, 0.125), c(0.125, 0.500, 0.875, 1.000))
  colnames(df) <- c("successes", "probability", "cumulative")
  class(df) <- c("bincum", "data.frame")

  expect_equal(bin_cumulative(x, y), df)
  expect_error(bin_cumulative(j, y))
  expect_error(bin_cumulative(x, k))
})
