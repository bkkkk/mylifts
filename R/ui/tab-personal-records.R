tab_personal_records <- tabItem(
  "personal_records",
  fluidRow(
    box(
      width = 12,
      title = "Personal Records",
      DT::dataTableOutput("personal_records")
    )
  )
)
