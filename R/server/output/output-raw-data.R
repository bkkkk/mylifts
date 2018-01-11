output$tbl_raw_data <- renderDataTable({
  .data <- raw_weights_data()
  datatable(.data, rownames = FALSE)
})
