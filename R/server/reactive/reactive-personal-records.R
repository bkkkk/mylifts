personal_records_data <- reactive({
  result <- select(raw_weights_data(), exercise_id, exercise, exercise, weight, reps)
  result <- group_by(result, exercise, reps)
  result <- top_n(result, 1, weight)
  result <- select(result, exercise, weight, reps)
  result <- distinct(result)
  result <- ungroup(result)
  result <- spread(result, reps, weight)

  return(result)
})
