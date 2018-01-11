output$personal_records <- renderDataTable({
  .data <- personal_records_data()
  .data <- mutate(.data, exercise = tools::toTitleCase(exercise))
  
  dt <- datatable(
    .data,
    colnames = c("Exercise" = "exercise"),
    filter = "none",
    style = "bootstrap", class = "display",
    options = list(dom = "t", ordering = FALSE),
    extensions = 'Responsive'
  )
  return(dt)
})
