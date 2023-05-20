# << WARNING >>

# Please *do not* replicate anything in this script; it is following bad programming practices (intentionally for illustrative effect)

# The key problems with this script are as follows:

# 1. The number of trials (or anything else) is not parametrised
# 2. Inconsistent naming conventions
# 3. Using loops in a naive way
# 4. Growing objects in a loop in a naive way
# 5. Failing to utilise inbuilt functionality (e.g. cumsum)
# 6. Unnecessary repetition: mainly the `ifelse()` calls
# 7. Lack of abstraction (e.g. functions)

x <- runif(n = 1000, min = 0, max = 1)
y <- runif(n = 1000, min = 0, max = 1)

distances <- c()
for (i in 1:1000) {
  distances <- c(distances, sqrt(x[i] ^ 2 + y[i] ^ 2))
}

flagInsideOrOutside <- ifelse(distances <= 1, 'Inside', 'Outside')

inside <- ifelse(flag == 'Inside', 1, 0)

cumulative_inside <- c()
for (i in 1:1000) {
  if (i == 1) {
    cumulative_inside[1] <- inside[1]
  } else {
    cumulative_inside[i] <- cumulative_inside[i - 1] + inside[i]
  }
}

piResults <- c()
for (i in 1:1000) {
  numberOfPointsInsideTheSquare <- i
  piResults <- c(piResults, 4 * cumulative_inside[i] / numberOfPointsInsideTheSquare)
}




 