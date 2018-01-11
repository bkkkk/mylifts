summarize_sets <- function(.data, method) {
  summary_fn = summarize_sets_by_max_weight  
  
  if(method == "avg")
    summary_fn <- summarize_sets_by_avg
  
  result <- summary_fn(.data)

  result <- nest(result, id, set, weight, reps, set_type)
  result <- arrange(result, date, exercise_id)
  result <- mutate(result, lift_id = paste0(as.numeric(date), exercise_id))
  result <- select(result, -variant)
  result <- select(result, lift_id, everything())

  return(result)
}

summarize_sets_by_max_weight <- function(.data) {
  result <- group_by(.data, date, exercise_id, exercise)
  result <- arrange(result, desc(weight), desc(reps))
  result <- mutate(
    result,
    total_volume = sum(reps * weight),
    max_weight = weight[1],
    max_reps = reps[1]
  )
  result <- ungroup(result)

  return(result)
}

summarize_sets_by_avg <- function(.data) {
  result <- group_by(.data, exercise_id, exercise, date)
  result <- mutate(result, set_volume = reps * weight)
  result <- mutate(
    result,
    total_volume = sum(set_volume),
    max_weight = round(sum(set_volume[set_type == "N"]) / sum(reps[set_type == "N"]), 1),
    max_reps = round(sum(reps[set_type == "N"]) / max(set[set_type == "N"]))
  )
  result <- select(result, -set_volume)
  result <- ungroup(result)

  return(result)
}

estimate_one_rep_max <- function(.data) {
  result <- mutate(result, rmmm = round(to_1rm(weight, reps)))
  
  return(result)
}

to_1rm <- function(x, n) {
  return(x * (36/(37-n)))
}

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

from_xrm <- function(n, rm) {
  return(rm*(37-n)/36)
}
