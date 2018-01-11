output$plot_weekly_exercise <- renderHighchart({
  show_sets <- input$weekly_progress_show_sets

  plot_exercise_progress(weekly_progress_data(), show_sets = show_sets)
})
