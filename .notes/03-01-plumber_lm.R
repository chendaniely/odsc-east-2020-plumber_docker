mod <- readRDS(here::here(".notes/", "model.RDS"))

#* Predict a diamond price
#* @param new_dat new data
#* @get /predict
predict_price <- function(new_dat) {
  one_row <- jsonlite::fromJSON(new_dat) %>% as.data.frame()

  return(
    list(
      price = predict.lm(object = mod, newdata = one_row)
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
