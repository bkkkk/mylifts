input_exercise_data <- reactive({
  .data <- distinct(select(raw_weights_data(), exercise, exercise_id))
  df_to_named(.data$exercise_id, tools::toTitleCase(.data$exercise))
})
