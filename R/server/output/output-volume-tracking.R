source("R/server/render/plot-exercise-volume.R")

output$volume_by_exercise <- renderPlotly({
  plot_volume_by_exercise(summarized_sets_data())
})

output$volume_by_relative_intensity <- renderHighchart({
  
})
