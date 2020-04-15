# this script represents your data and ml pipeline

library(dplyr)

data(diamonds, package = "ggplot2")

test_i <- sample(1:nrow(diamonds), size = round(.1 * nrow(diamonds)))

dat_testx <- diamonds %>% dplyr::slice(test_i) %>% select(-price)
dat_testy <- diamonds %>% dplyr::slice(test_i) %>% select(price)
dat_train <- diamonds[-test_i, ]

names(dat_train)

fit <- lm(price ~ ., data = dat_train)

predict.lm(object = fit, newdata = dat_testx[2, ])


saveRDS(dat_testx, file = "testx.RDS")
saveRDS(dat_testy, file = "testy.RDS")
saveRDS(fit, file = "model.RDS")
