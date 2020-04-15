library(jsonlite)

mod <- readRDS("model.RDS")
# dat <- readRDS("testx.RDS")

#* predict diamond price
#*
#* @param new_data new data
#* @get /predict
function(new_data) {
  one_row <- as.data.frame(jsonlite::fromJSON(new_data))

  return(
    list(
      price = predict.lm(mod, newdata = one_row)
    )
  )
}

#* Predict a diamond price given separate values
#* @param carat
#* @param cut
#* @param color
#* @param clarity
#* @param depth
#* @param table
#* @param x
#* @param y
#* @param z
#* @get /predict2
function(carat, cut, color, clarity, depth, table, x, y, z) {
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
