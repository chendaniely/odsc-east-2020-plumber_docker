library(jsonlite)

mod <- readRDS("model.RDS")
dat <- readRDS("testx.RDS")

example_json <- '[{"carat":0.53,"cut":"Premium","color":"D","clarity":"SI1","depth":61,"table":58,"x":5.18,"y":5.22,"z":3.17}]'

predict_price <- function(new_data) {
  one_row <- as.data.frame(jsonlite::fromJSON(new_data))

  return(
    list(
      price = predict.lm(mod, newdata = one_row)
    )
  )
}

predict_price(example_json)

predict_price2 <- function(carat, cut, color, clarity, depth, table, x, y, z) {
  dat <- data.frame(
    carat = as.numeric(carat),
    cut = as.character(cut),
    color = as.character(color),
    clarity = as.character(clarity),
    depth = as.numeric(depth),
    table = as.numeric(table),
    x = as.numeric(x),
    y = as.numeric(y),
    z = as.numeric(z)
  )
  return(
    list(
      price = predict.lm(mod, dat)
    )
  )
}

predict_price2(carat = 1,
               cut = "Ideal",
               color = "D",
               clarity = "VVS2",
               depth = 50,
               table = 55,
               x = 5.1,
               y = 5.1,
               z = 5.1)
