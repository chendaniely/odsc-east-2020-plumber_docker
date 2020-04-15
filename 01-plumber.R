library(ggplot2)

#* Echo my name
#*
#* @get /whoami
function() {
  return(
    list(name = "Daniel")
  )
}

#* Echo back the input
#*
#* @param msg The message to echo
#* @get /echo
function(msg = "") {
  return(
    list(msg = paste0("Message: '", msg, "'"))
    #list(msg = glue::glue("Message: '{msg}'"))
  )
}

#* Takes the average between 2 numbers
#*
#* @param x the first number
#* @param y the sectond number
#* @get /avg2
function(x, y) {
  return(
    list(result = (x + y) / 2)
  )
}

#* Plots cars dataset
#*
#* @get /carplot
#* @png
function() {
  print(
    ggplot(cars, aes(x = speed, y = dist)) + geom_point()
  )
}

#* Generate an error
#*
#* @get /err
function(res) {
  msg <- "Hi! you did something wrong :)"
  res$status <- 400 # bad request
  return(
    list(error = jsonlite::unbox(msg))
  )
}
