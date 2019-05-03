####################### Part 1.3 - bin_choose()

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
