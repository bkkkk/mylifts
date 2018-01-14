df_to_named <- function(x, y) {
  names(x) <- y
  return(x)
}

set_type_label <- function(type = c("N", "P", "D")) {
  c("N" = "Normal", "P" = "Pause", "D" = "Drop")[[type]]
}

intensity_label <- function(x) {
  cut(x, c(0, 3, 7, 10, 15, Inf), labels = c("Max", "High", "Strength", "Hyperthrophy", "Warmup"))
}
