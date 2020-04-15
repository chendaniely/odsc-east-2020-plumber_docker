library(ggplot2)

whoami <- function() {
  return(
    list(name = "Daniel")
  )
}

echo <- function(msg = "") {
  return(
    list(msg = paste0("Message: '", msg, "'"))
    #list(msg = glue::glue("Message: '{msg}'"))
  )
}

avg2 <- function(x, y) {
  return(
    list(result = (x + y) / 2)
  )
}

carplot <- function() {
  print(
    ggplot(cars, aes(x = speed, y = dist)) + geom_point()
  )
}

err <- function(res) {
  msg <- "Hi! you did something wrong :)"
  res$status <- 400 # bad request
  return(
    list(error = jsonlite::unbox(msg))
  )
}
