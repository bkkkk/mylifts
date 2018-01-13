to_lean_mass <- function(w, f) {
  if(f > 1) {
    f <- f / 100
  }
  w * (1 - f)
}

to_pounds <- function(w) {
  w * 2.20462
}
