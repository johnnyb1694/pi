setup_parameters <- function(n_trials, min = 0, max = 1, seed = 123) {
  
  set.seed(seed)
  
  params <- c(seed = seed, n_trials = n_trials, min = min, max = max)
  
  return(params)
}