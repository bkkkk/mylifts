tab_volume_tracking <- tabItem(
  "volume_tracking",
  fluidRow(
    box(
      width = 12,
      title = "Volume by Exercise",
      plotlyOutput("volume_by_exercise")
    )
  ),
  fluidRow(
    box(
      width = 12,
      title = "Volume by Relative Intensity",
      plotlyOutput("volume_by_relative_intensity")
    )
  )
)
