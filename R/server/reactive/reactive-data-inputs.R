raw_weights_data <- reactive({
  path <- "./"
  import_file <- "raw_data.rds"
  
  fullpath <- paste0(path, import_file)
  
  key <- gs_key(gs_raw_key())

  if(!file.exists(fullpath)) {
    .data <- gs_read(key)
    write_rds(.data, fullpath)

    return(.data)
  }

  file_last_updated_on <- ymd_hms(file.info(fullpath)$ctime)
  sheet_updated_on <- ymd_hms(key$updated)

  if(file_last_updated_on < sheet_updated_on) {
    .data <- gs_read(key)
    write_rds(.data, fullpath)

    return(.data)
  }

  read_rds(fullpath)
})

plan_data <- reactive({
  gs_read(gs_key(gs_plan_key()))
})
