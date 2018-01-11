tab_exercise_progress <- tabItem(
  "exercise_progress",
  fluidRow(
    box(
      width = 12,
      title = "Options",
      selectInput(
        "weekly_progress_exercise",
        label = "Select Exercise",
        choices = NULL
      )
    )
  ),
  fluidRow(
    box(
      width = 12,
      title = "Weekly Progress",
      highchartOutput("plot_weekly_exercise", height = 400)
    )
  )
)
