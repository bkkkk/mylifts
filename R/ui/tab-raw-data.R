tab_raw_data <- tabItem(
  "raw_data",
  fluidRow(
    box(
      width = 12,
      title = "Raw Data",
      dataTableOutput("tbl_raw_data")
    )
  )
)
