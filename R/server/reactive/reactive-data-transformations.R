summarized_sets_data <- reactive({
  summarize_sets(raw_weights_data(), method = input$config_summary_method)
})

with_1rm_data <- reactive({
  estimate_one_rep_max(summarized_sets_data())
})

with_estimates_data <- reactive({
  add_expected_lifts(with_1rm_data(), plan_data())
})
