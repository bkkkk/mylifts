plot_exercise_progress <- function(.data, show_sets = FALSE) {
  pointFormat <- "Set {point.set}: {point.reps} × {point.weight} kg ({point.set_type})"
  
  .data <- mutate(.data, exercise = tools::toTitleCase(exercise))
  details <- unnest(select(.data, exercise, date, data))
  
  p <- plot_ly(colors = "Dark2", color = ~exercise)
  p <- add_lines(
    p,
    data = .data,
    x = ~date, y = ~max_weight,
    hoverinfo = "text",
    text = ~paste0(
      exercise, "(", date, ")<br>",
      "<b>Total Volume: </b>", total_volume, " kg<br>",
      "<b>Avg. Weight: </b>", max_weight, "kg)"
    ),
    type = 'scatter', mode = 'lines'
  )
  p <- add_markers(
    p,
    data = details,
    x = ~date,
    y = ~weight,
    size = ~reps,
    type = "scatter"
  )
  p <- layout(
    p,
    xaxis = list(title = ""),
    yaxis = list(title = "Weight [kg]"),
    legend = list(orientation = "h")
  )
  return(p)
}
