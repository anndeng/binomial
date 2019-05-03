##################### Part 1.8 - Functions of measures

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


