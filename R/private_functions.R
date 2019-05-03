##################### Part 1.1 - Private functions

# private function check_prob()
# checks if input is a valid probability value
check_prob <- function(prob) {
  if (prob <= 0 | prob >= 1) {
    stop("p must be a number between 0 and 1")
  } else {
    return(TRUE)
  }
}

# private function check_trials()
# checks if input is a valid value for number of trials
check_trials <- function(trials) {
  if (trials < 0) {
    stop("number of trials must be non-negative")
  } else if (trials %% 1 != 0) {
    stop("input must be an integer")
  } else {
    return(TRUE)
  }
}

# private function check_success()
# checks if input is a valid value for number of successes
check_success <- function(success, trials) {
  if (success < 0) {
    stop("input must be non-negative")
  } else if (success %% 1 != 0) {
    stop("input must be an integer")
  } else if (success > trials) {
    stop("number of successes cannot be greater than number of trials")
  } else {
    return(TRUE)
  }
}

################### Part 1.2 - More private functions

# private function aux_mean()
# outputs mean of binomial distribution
aux_mean <- function(trials, prob) {
  return(prob*trials)
}

# private function aux_variance()
# outputs variance of binomial distribution
aux_variance <- function(trials, prob) {
  return((prob*trials)*(1-prob))
}

# private function aux_mode()
# outputs mode of distribution
aux_mode <- function(trials, prob) {
  if (is.integer(prob*trials + prob) == TRUE) {
    return(c(prob*trials + prob, prob*trials + prob - 1))
  } else {
    return((prob*trials + prob) %/% 1)
  }
}

# private function aux_skewness()
# outputs skewness of binomial random variable
aux_skewness <- function(trials, prob) {
  return((1 - 2*prob) / sqrt((prob*trials) * (1 - prob)))
}

# private function aux_kurtosis()
# outputs kurtosis of binomial random variable
aux_kurtosis <- function(trials, prob) {
  return((1 - 6*prob*(1 - prob)) / (prob*trials*(1 - prob)))
}
