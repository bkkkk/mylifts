df_to_named <- function(x, y) {
  names(x) <- y
  return(x)
}

set_type_label <- function(type = c("N", "P", "D")) {
  c("N" = "Normal", "P" = "Pause", "D" = "Drop")[[type]]
}
