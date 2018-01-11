tab_configure <- tabItem(
  "configure",
  fluidRow(
    box(
      width = 12, title = "Data Import",
      textInput(
        "config_gs_id",
        "Google Sheets Weights Code:",
        value = "1nUOosw9HnqM15sooQrdUd8a1SYhiVkmZ7At1OZx-ifM"
      ),
      textInput(
        "config_gs_plan_id",
        "Google Sheets Plan Code:",
        value = "1ElMWr1-wsTs9ujjT9OLR3P67TYcM-bK7xX_F3h4WteY"
      )
    )
  ),
  fluidRow(
    box(
      width = 12, title = "Weight Summary",
      selectInput(
        "config_summary_method", label = "Lift summary method",
        choices = c("Max Weight" = "max", "Rep Weighted Avg" = "avg")
      )
    )
  )
)
