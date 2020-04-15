mod <- readRDS(here::here(".notes/", "model.RDS"))
dat <- readRDS(here::here(".notes", "testx.RDS"))

predict_price <- function(new_dat) {
  one_row <- jsonlite::fromJSON(new_dat) %>% as.data.frame()

  return(
    list(
      price = predict.lm(object = mod, newdata = one_row)
    )
  )
}

dat_json <- jsonlite::toJSON(dat[1, ])

predict_price(dat_json)

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
