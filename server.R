library(shiny)
library(tidyverse)
library(lubridate)
library(googlesheets)

source("R/server/render/plot-exercise-progress.R")
source("R/server/func.R")

shinyServer(function(input, output, session) {
  source("R/server/reactive/reactive-inputs-data.R", local = TRUE)
  source("R/server/reactive/reactive-configure.R", local = TRUE)
  source("R/server/reactive/reactive-data-ingest.R", local = TRUE)
  source("R/server/reactive/reactive-data-transformations.R", local = TRUE)
  source("R/server/reactive/reactive-personal-records.R", local = TRUE)
  source("R/server/reactive/reactive-volume-tracking.R", local = TRUE)
  source("R/server/reactive/reactive-weekly-progress.R", local = TRUE)

  source("R/server/observers/observers-weekly-progress.R", local = TRUE)
  
  source("R/server/output/output-weekly-progress.R", local = TRUE)
  source("R/server/output/output-raw-data.R", local = TRUE)
  source("R/server/output/output-weekly-progress.R", local = TRUE)
  source("R/server/output/output-personal-records.R", local = TRUE)
  source("R/server/output/output-volume-tracking.R", local = TRUE)
})
