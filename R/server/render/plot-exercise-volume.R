plot_volume_by_exercise <- function(.data) {
  result <- mutate(.data, day_label = dense_rank(date))
  
  result <- group_by(result, day_label, exercise)
  result <- summarize(result, total_volume = sum(total_volume))
  
  p <- plot_ly(
    result,
    x = ~day_label, y = ~total_volume, color = ~exercise,
    text = ~paste0("<b>", exercise,"</b>", ": ", total_volume, " kg"),
    hoverinfo = 'text',
    type = "bar",
    colors = "Dark2"
  )
  layout(
    p,
    xaxis = list(title = ""),
    yaxis = list(title = 'Volume [kg]'),
    barmode = 'stack',
    legend = list(orientation = "h")
  )
}

