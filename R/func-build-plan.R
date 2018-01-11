build_exercise_plan <- function(start_date, lifts, plan_length = 12, rep_min = c(12, 9, 6, 3), rep_diff = 2.0) {
  n_lifts <- length(lifts)
  top_rep_min <- max(rep_min)
  n_rep_ranges <- length(rep_min)
  
  estimates <- data_frame(
    date = rep(seq(from = ymd(start_date), by = '1 week', length.out = plan_length), n_lifts),
    reps_min = rep(rep_min, n_lifts * plan_length / n_rep_ranges)
  )
  
  estimates <- arrange(estimates, date)
  estimates <- mutate(
    estimates,
    exercise_id = rep(lifts, plan_length),
    reps_max = if_else(reps_min == top_rep_min, reps_min + rep_diff + 1, reps_min + rep_diff)
  )
  estimates <- select(estimates, date, exercise_id, reps_min, reps_max)
  estimates <- arrange(estimates, date, exercise_id)  
  return(estimates)
}
