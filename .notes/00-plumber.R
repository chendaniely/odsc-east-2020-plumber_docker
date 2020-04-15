library(ggplot2)

#* Echo myname
#* @get /whoami
function() {
  return(
    list(msg = "Daniel")
  )
}

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg="") {
  return(
    list(msg = paste0("Message: '", msg, "'"))
  )
}

#* Return the mean of two numbers
#* @param x The first number
#* @param y The second number
#* @get /avg2
function(x, y) {
  x <- as.numeric(x)
  y <- as.numeric(y)
  return(
    list(result = (x + y) / 2)
  )
}

#* plot cars and use the png serializer
#* @get /carplot
#* @png
function() {
  print(
    ggplot(cars, aes(x = speed, y = dist)) +
      geom_point()
  )
}

#' Generate an error
#' @get /error
function(res){
  msg <- "hi! you did something wrong. :)"
  res$status <- 400 # Bad request
  list(error=jsonlite::unbox(msg))
}
