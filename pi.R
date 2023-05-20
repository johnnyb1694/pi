pi_results <- setup_parameters(n_trials = 100000L) |>
  simulate_points() |>
  compute_dist_to_origin() |>
  determine_classification() |>
  generate_pi_estimates()

plot_pi_estimates(pi_results)
 