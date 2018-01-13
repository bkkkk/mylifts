source("R/server/func-calculators.R")
source("R/server/func-conversions.R")

add_expected_lifts <- function(lifts, plan) {
  lagged_lifts <- mutate(lifts, date = date + weeks(1))
  lagged_lifts <- select(lagged_lifts, -weight, -reps)
  lagged_lifts <- rename(lagged_lifts, estimated_from_last = rmmm)
  
  results <- full_join(lifts, lagged_lifts)
  results <- left_join(results, plan)
  results <- mutate(
    results,
    estimated_min = trunc(from_xrm(reps_min, estimated_from_last) / 0.25)  * 0.25,
    estimated_max = trunc(from_xrm(reps_max, estimated_from_last) / 0.25)  * 0.25
  )
  results <- select(results, -estimated_from_last, -rmmm, -reps_min, -reps_max)
  return(results)
}

estimate_one_rep_max <- function(.data) {
  result <- mutate(result, rmmm = round(to_1rm(weight, reps)))
  
  return(result)
}
