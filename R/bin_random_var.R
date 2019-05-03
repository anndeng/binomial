##################### Part 1.7 - bin_variable()

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