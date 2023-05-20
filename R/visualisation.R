box::use(ggplot2[...])

plot_pi <- function(pi_results) {
  
  n_trials <- length(pi_results)
  
  to_plot <- data.frame(trial_number = seq_len(n_trials), pi_results)
  
  pi_plot <- ggplot(data = to_plot, mapping = aes(x = trial_number, y = pi_results)) +
    geom_line() +
    geom_hline(yintercept = pi, lty = 'dashed') +
    theme_light() +
    scale_x_continuous(labels = scales::comma_format()) +
    labs(x = 'Trial',
         y = 'Estimate',
         title = 'Time series of estimates for pi',
         subtitle = 'Dotted line shows the value we are aiming for (to a degree)')
  
  return(pi_plot)
}

.on_load = function(ns) {
  
  message(
    'Loading module "', box::name(), '"\n',
    'Module path: "', basename(box::file()), '"'
  )
  
}

box::export(plot_pi)