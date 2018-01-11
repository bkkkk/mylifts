weekly_progress_data <- reactive({
  target_exercise_id <- input$weekly_progress_exercise
  
  .data <- filter(summarized_sets_data(), exercise_id == target_exercise_id)

  return(.data)
})
