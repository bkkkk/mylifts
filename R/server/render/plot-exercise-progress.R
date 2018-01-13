build_summary_hover <- function(exercise, date, total_volume, max_weight) {
  glue::glue(
    "{exercise} ({date})<br>",
    "<b>Total Volume: </b>{total_volume} kg<br>",
    "<b>Avg. Weight: </b>{max_weight} kg"
  )
}

plot_exercise_progress <- function(.data, show_sets = FALSE) {
  pointFormat <- "Set {point.set}: {point.reps} × {point.weight} kg ({point.set_type})"

  .data <- mutate(.data, exercise = tools::toTitleCase(exercise))
  details <- unnest(select(.data, date, data))
  
  p <- plot_ly(
    .data,
    x = ~date, y = ~max_weight, color = ~exercise,
    hoverinfo = "text",
    text = ~build_summary_hover(exercise, date, total_volume, max_weight),
    type = 'scatter', mode = 'lines', colors = "Dark2"
  )
  p <- layout(
    p,
    xaxis = list(title = ""),
    yaxis = list(title = "Weight [kg]"),
    legend = list(orientation = "h")
  )
  return(p)
}
