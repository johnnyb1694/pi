box::use(./R/simulation[simulate_pi])
box::use(./R/visualisation[plot_pi])

simulation_params <- config::get('default_simulation_params')

estimates <- simulate_pi(n_trials = simulation_params[['n_trials']])

plot <- plot_pi(estimates)
