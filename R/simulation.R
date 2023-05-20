box::use(./parameters[setup_parameters])

simulate_points <- function(params) {
  
  x <- stats::runif(n = params[['n_trials']], min = params[['min']], max = params[['max']])
  y <- stats::runif(n = params[['n_trials']], min = params[['min']], max = params[['max']])
  
  points <- data.frame(x, y)
  
  return(points)
}

compute_dist_to_origin <- function(points) {
  
  distance_to_origin <- sqrt(points[['x']]^2 + points[['y']]^2)
  
  return(distance_to_origin)
}

determine_classification <- function(distance_to_origin) {
  
  inside <- (distance_to_origin <= 1)
  
  return(inside)
}

generate_pi_estimates <- function(inside) {
  
  n_trials <- length(inside)
  
  cumulative_inside <- cumsum(inside)
  pi_results <- (4 * cumulative_inside) / seq_len(n_trials)
  
  return(pi_results)
}

simulate_pi <- function(n_trials) {
  
  setup_parameters(n_trials = n_trials) |>
    simulate_points() |>
    compute_dist_to_origin() |>
    determine_classification() |>
    generate_pi_estimates()

}