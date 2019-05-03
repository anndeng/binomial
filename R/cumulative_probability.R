####################### Part 1.6 - cumulative probability

#' @title bin_cumulative()
#' @description uses bin_distribution to output prob. distribution and cumulative probabilities
#' @param trials number of trials
#' @param prob probability of success
#' @return data frame with probability distribution and cumulative probabilities and class "bincum
#' @export
#' @examples bin_cumulative(5, 0.5) ## returns data.frame(c(0, 1, 2, 3, 4, 5), c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125), c(0.03125, 0.18750, 0.50000, 0.81250, 0.96875, 1.00000)) 
bin_cumulative <- function(trials, prob) {
  df <- bin_distribution(trials, prob)
  vec <- df$probability
  for (i in 1:length(df$probability)) {
    vec[i] <- sum(df$probability[1:i])
  }
  df$cumulative <- vec
  class(df) <- c("bincum", "data.frame")
  return(df)
}

#' @export
plot.bincum <- function(cdist) {
  successes <- cdist$successes
  probability <- cdist$cumulative
  plot(successes, probability, type = "b")
}