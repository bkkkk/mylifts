tab_exercise_progress <- tabItem(
  "weekly_exercise_progress",
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
      plotlyOutput("plot_weekly_exercise", height = 400)
    )
  )
)
