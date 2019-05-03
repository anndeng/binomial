##################### Part 1.1 

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
  } else if (success >= trials) {
    stop("number of successes cannot be greater than number of trials")
  } else {
    return(TRUE)
  }
}

################### Part 1.2

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

####################### Part 1.3

#' @title bin_choose()
#' @description uses factorial() to compute number of combinations in which k successes can occur in n trials
#' @param n number of trials
#' @param k number of successes
#' @return double of combinations 
#' @export
#' @examples bin_choose(n = 5, k = 2) ## returns 10
bin_choose <- function(n, k) {
  if ((k > n) == TRUE) {
    stop("k cannot be greater than n")
  } else return(factorial(n) / (factorial(k) * factorial(n - k)))
}

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

#' @title bin_distribution()
#' @description uses bin_probability to output probability distribution
#' @param trials number of trials
#' @param prob probability of success
#' @return data frame with probability distribution with class "bindis"
#' @export
#' @examples bin_distribution(5, 0.5) ## returns data.frame(c(0, 1, 2, 3, 4, 5), c(0.03125, 0.15625, 0.31250, 0.31250, 0.15625, 0.03125)) 
bin_distribution <- function(trials, prob) {
  successes <- as.vector(0:trials)
  probability <- bin_probability(successes, trials, prob)
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

#' @title bin_variable()
#' @description returns object of class "binvar" (binomial random variable)
#' @param trials number of trials
#' @param prob probability of success
#' @return object of class "binvar"
#' @export
#' @examples bin_variable(5, 0.5) ## returns list(5, 0.5)
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  lst <- list(trials, prob)
  names(lst) <- c("trials", "prob")
  class(lst) <- c("binvar", "data.frame")
  return(lst)
}

#' @export
print.binvar <- function(binvar) {
  print("Binomial variable")
  print(noquote(""))
  print(noquote("Parameters"))
  print(noquote(paste("- number of trials:", bin1$trials, sep = ' ')))
  print(noquote(paste("- prob of success:", bin1$prob, sep = ' ')))
}

#' @export
summary.binvar <- function(binvar) {
  trials <- binvar$trials
  df <- data.frame(trials)
  df$prob <- binvar$prob
  df$mean <- aux_mean(df$trials, df$prob)
  df$variance <- aux_variance(df$trials, df$prob)
  df$mode <- aux_mode(df$trials, df$prob)
  df$skewness <- aux_skewness(df$trials, df$prob)
  df$kurtosis <- aux_kurtosis(df$trials, df$prob)
  class(df) <- ("summary.binvar")
  return(df)
}
  
#' @export
print.summary.binvar <- function(summary) {
  print("Summary Binomial")
  print(noquote(""))
  print(noquote("Parameters"))
  print(noquote(paste("- number of trials:", summary$trials, sep = ' ')))
  print(noquote(paste("- prob of success:", summary$prob, sep = ' ')))
  print(noquote(""))
  print(noquote("Measures"))
  print(noquote(paste("- mean:", summary$mean, sep = ' ')))
  print(noquote(paste("- variance:", summary$variance, sep = ' ')))
  print(noquote(paste("- mode:", summary$mode, sep = ' ')))
  print(noquote(paste("- skewness:", summary$skewness, sep = ' ')))
  print(noquote(paste("- kurtosis:", summary$kurtosis, sep = ' ')))
}

#' @title bin_mean()
#' @description returns mean of binvar with trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return double of mean
#' @export
#' @examples bin_mean(10, 0.3) ## returns 3
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mean(trials, prob)
}

#' @title bin_variance()
#' @description returns variance of binvar with trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return double of variance
#' @export
#' @examples bin_variance(10, 0.3) ## returns 2.1
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_variance(trials, prob)
}

#' @title bin_mode()
#' @description returns mode of binvar with trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return double of mode
#' @export
#' @examples bin_mode(10, 0.3) ## returns 3
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_mode(trials, prob)
}

#' @title bin_skewness()
#' @description returns skewness of binvar with trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return double of skewness
#' @export
#' @examples bin_skewness(10, 0.3) ## returns 0.2760262
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_skewness(trials, prob)
}

#' @title bin_kurtosis()
#' @description returns kurtosis of binvar with trials and prob
#' @param trials number of trials
#' @param prob probability of success
#' @return double of kurtosis
#' @export
#' @examples bin_kurtosis(10, 0.3) ## returns -0.1238095
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  aux_kurtosis(trials, prob)
}


