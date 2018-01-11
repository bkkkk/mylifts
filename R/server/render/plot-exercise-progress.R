plot_exercise_progress <- function(.data, show_sets = FALSE) {
  summary_tooltip <- list(
    shared = FALSE,
    useHTML = TRUE,
    headerFormat = "<small>{point.key}</small><table><br />",
    pointFormat = "Total Volume: <b>{point.total_volume}</b></div><br />
    Lift Avg.: <b>{point.y}</b></div>"
  )

  details_tooltip <- list(
    shared = FALSE,
    useHTML = TRUE,
    headerFormat = "",
    pointFormat = "Set {point.set}: {point.reps} × {point.weight} kg ({point.set_type})"
  )
  
  # Add data summary
  details <- unnest(select(.data, date, data))

  hc <- highchart(theme = hc_theme_elementary())
  hc <- hc_legend(hc, enabled = FALSE)
  hc <- hc_yAxis(hc, title = "Weight [Kg]")
  hc <- hc_xAxis(hc, type = "datetime")
  hc <- hc_add_series(
    hc,
    name = "Summarized Lift",
    type = "spline",
    data = .data,
    hcaes(x = date, y = max_weight),
    marker = list(enabled = FALSE),
    tooltip = summary_tooltip
  )
  hc <- hc_add_series(
    hc,
    type = "scatter",
    data = details,
    mapping = hcaes(x = date, y = weight, color = set_type),
    tooltip = details_tooltip
  )

  return(hc)  
}

plot_set_details <- function(.data) {
  plot_set_facet <- function(.data, title) {
    hc <- highchart(theme = hc_theme_elementary())
    hc <- hc_legend(hc, enabled = FALSE)
    hc <- hc_yAxis(hc, title = "Weight [Kg]")
    hc <- hc_xAxis(hc, title = "Reps")
    hc <- hc_title(hc, text = as.character(title, "%Y-%m-%d"))
    hc <- hc_add_series(
      hc,
      name = "Summarized Lift",
      type = "scatter",
      data = .data,
      hcaes(x = reps, y = weight, color = set)
    )
    
    return(hc)
  }
  
  .data <- select(.data, date, data)
  .data <- unnest(.data)
  .data <- select(.data, date, set, reps, weight)
  .data <- nest(.data, -date)
  plots <- map2(.x = .data$data, .y = .data$date, .f = plot_set_facet)
  hc_grid <- hw_grid(plots, ncol = length(plots))

  return(hc_grid)
}
