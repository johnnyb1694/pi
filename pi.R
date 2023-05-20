box::use(./R/simulation)
box::use(./R/visualisation)

simulate <- simulation$simulate_pi
viz <- visualisation$plot_pi_estimates

res <- simulate(n_trials = 10000L)
plot <- viz(res)
