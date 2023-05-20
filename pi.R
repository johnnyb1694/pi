# << WARNING >>

# Please *do not* replicate anything in this script; it is following bad programming practices (intentionally for illustrative effect)

# The key problems with this script are as follows:

# 1. The number of trials (or anything else) is not parametrised as an integer (x)
# 2. Inconsistent naming conventions
# 3. Using loops in a naive way
# 4. Growing objects in a loop in a naive way
# 5. Failing to utilise inbuilt functionality (e.g. cumsum)
# 6. Unnecessary repetition: mainly the `ifelse()` calls
# 7. Lack of abstraction (e.g. functions); it is monolithic
# 8. Naive use of `:` sequence operator; better practice to use `seq_len()` or the like
# 9. No seed present: this is a simulation model after all!

# Other practices which could help but deserve broader treatment:

# 1. Virtual environments
# 2. Configuration file
# 3. Modularisation
# 4. Testing

n_trials <- 1000L
min <- 0
max <- 1

x <- runif(n = n_trials, min = min, max = max)
y <- runif(n = n_trials, min = min, max = max)

distances <- c()
for (i in 1:n_trials) {
  distances <- c(distances, sqrt(x[i] ^ 2 + y[i] ^ 2))
}

flag_inside_or_outside <- ifelse(distances <= 1, 'Inside', 'Outside')

inside <- ifelse(flag == 'Inside', 1, 0)

cumulative_inside <- c()
for (i in 1:n_trials) {
  if (i == 1) {
    cumulative_inside[1] <- inside[1]
  } else {
    cumulative_inside[i] <- cumulative_inside[i - 1] + inside[i]
  }
}

pi_results <- c()
for (i in 1:n_trials) {
  number_of_points_inside_the_square <- i
  piResults <- c(piResults, 4 * cumulative_inside[i] / number_of_points_inside_the_square)
}




 