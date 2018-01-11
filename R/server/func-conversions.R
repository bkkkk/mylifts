rmr <- function(weight, height, age, activity) {
  if(height < 3) {
    height <- height * 100
  }
  activity_factors <- c(1.2, 1.375, 1.55, 1.7, 1.9)
  
  resting <- 9.99 * weight + 6.25 * height - 4.92 * age + 5
  af <- activity_factors[activity]
  return(resting * af)
}

to_lean_mass <- function(w, f) {
  if(f > 1) {
    f <- f / 100
  }
  w * (1 - f)
}

to_pounds <- function(w) {
  w * 2.20462
}
