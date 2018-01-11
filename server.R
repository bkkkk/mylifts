library(shiny)
library(tidyverse)
library(lubridate)
library(googlesheets)

source("R/server/render/plot-exercise-progress.R")
source("R/func-weights.R")
source("R/func.R")

shinyServer(function(input, output, session) {
  source("R/server/reactive/reactive-configure.R", local = TRUE)
  source("R/server/reactive/reactive-data-inputs.R", local = TRUE)
  source("R/server/reactive/reactive-inputs-data.R", local = TRUE)
  source("R/server/reactive/reactive-data-transformations.R", local = TRUE)
  source("R/server/reactive/reactive-personal-records.R", local = TRUE)
  source("R/server/reactive/reactive-weekly-progress.R", local = TRUE)

  observe({
    updateSelectInput(
      session,
      inputId = "weekly_progress_exercise",
      choices = input_exercise_data()
    )
  })

  source("R/server/output/output-weekly-progress.R", local = TRUE)
  source("R/server/output/output-raw-data.R", local = TRUE)
  source("R/server/output/output-personal-records.R", local = TRUE)
})
