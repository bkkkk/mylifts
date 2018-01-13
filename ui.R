library(shiny)
library(shinydashboard)
library(DT)
library(plotly)

source("R/ui/tab-summary.R", local = TRUE)
source("R/ui/tab-personal-records.R")
source("R/ui/tab-exercise-progress.R", local = TRUE)
source("R/ui/tab-configure.R", local = TRUE)
source("R/ui/tab-raw-data.R", local = TRUE)

dashboardPage(
  dashboardHeader(title = "Strength Pal"),
  dashboardSidebar(
    sidebarMenu(
      menuItem(text = "Summary", tabName = "summary"),
      menuItem(text = "Personal Records", tabName = "personal_records"),
      menuItem(text = "Exercise Progress", tabName = "weekly_exercise_progress"),
      menuItem(text = "Raw Data", tabName = "raw_data"),
      menuItem(text = "Configure", tabName = "configure", icon = icon("gear"))
    )
  ),
  dashboardBody(
    tabItems(
      tab_summary,
      tab_exercise_progress,
      tab_personal_records,
      tab_raw_data,
      tab_configure
    )
  ),
  title = "Strength Pal",
  skin = "black"
)
