summarize_sets <- function(.data, method) {
  summary_fn = summarize_sets_by_max_weight  
  
  if(method == "avg")
    summary_fn <- summarize_sets_by_avg
  
  result <- summary_fn(.data)
  
  result <- mutate(result, intensity = intensity_label(reps))
  result <- nest(result, id, set, weight, reps, intensity, set_type)
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
