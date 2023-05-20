# << WARNING >>

# Please *do not* replicate anything in this script; it is following bad programming practices (intentionally for illustrative effect)

# The key problems with this script are as follows:

# 1. The number of trials (or anything else) is not parametrised as an integer (x)
# 2. Inconsistent naming conventions (x)
# 3. Using loops in a naive way (x)
# 4. Growing objects in a loop in a naive way (x)
# 5. Failing to utilise inbuilt functionality (e.g. cumsum) (x)
# 6. Unnecessary repetition: mainly the `ifelse()` calls (x)
# 7. Lack of abstraction (e.g. functions); it is monolithic (x)
# 8. Naive use of `:` sequence operator; better practice to use `seq_len()` or the like (x)
# 9. No seed present: this is a simulation model after all! (x)

# Other practices which could help but deserve broader treatment:

# 1. Virtual environments
# 2. Configuration file
# 3. Modularisation
# 4. Testing

# Setup
setup_parameters <- function(n_trials, min = 0, max = 1, seed = 123) {
  
  set.seed(seed)
  
  params <- c(seed = seed, n_trials = n_trials, min = min, max = max)
  
  return(params)
}

# Simulate points
simulate_points <- function(params) {
  
  x <- runif(n = params[['n_trials']], min = params[['min']], max = params[['max']])
  y <- runif(n = params[['n_trials']], min = params[['min']], max = params[['max']])
  
  points <- data.frame(x, y)
  
  return(points)
}

# Calculate distance to origin
compute_dist_to_origin <- function(points) {
  
  distance_to_origin <- sqrt(points[['x']]^2 + points[['y']]^2)
  
  return(distance_to_origin)
}

# Determine which points lie inside the circle
determine_classification <- function(distance_to_origin) {
  
  inside <- (distance_to_origin <= 1)
  
  return(inside)
}

# Calculate estimates of pi over time
generate_pi_estimates <- function(inside) {
  
  n_trials <- length(inside)
  
  cumulative_inside <- cumsum(inside)
  pi_results <- (4 * cumulative_inside) / seq_len(n_trials)
  
  return(pi_results)
}

# Pipeline-style execution
estimates <- setup_parameters(n_trials = 100000L) |>
  simulate_points() |>
  compute_dist_to_origin() |>
  determine_classification() |>
  generate_pi_estimates()




 