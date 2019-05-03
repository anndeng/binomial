# Basic functions outputting binomial probability and distribution

####################### Part 1.4 - bin_probability()

#' @title bin_probability()
#' @description uses bin_choose to compute probability of getting success in trials
#' @param success number of successes
#' @param trials number of trials
#' @param prob probability of success
#' @return double of probability
#' @export
#' @examples bin_probability(2, 5, 0.5) ## returns 0.3125
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return(bin_choose(trials, success) * prob^success * (1-prob)^(trials-success))
}

####################### Part 1.5 - bin_distribution()

#' @title bin_distribution()
#' @description uses bin_probability to output probability distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return data frame with probability distribution with class "bindis"
#' @export
#' @examples bin_distribution(5, 0.5) ## returns data.frame(c(0, 1, 2, 3, 4, 5), c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125))
bin_distribution <- function(trials, prob) {
  successes <- as.vector(0:trials)
  probability <- successes
  for (i in 1:length(successes)) {
    probability[i] <- bin_probability(i-1, trials, prob)
  }
  distrib <- data.frame(successes, probability)
  class(distrib) <- c("bindis", "data.frame")
  return(distrib)
}

#' @export
plot.bindis <- function(distrib) {
  successes <- distrib$successes
  probability <- distrib$probability
  barplot(probability, names.arg = as.character(successes), xlab = "successes", ylab = "probability")
}

############## come back to ^^^^^ to make graph prettier ##########
