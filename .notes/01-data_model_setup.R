library(dplyr)

data(diamonds, package = "ggplot2")

test_i <- sample(1:nrow(diamonds), size = round(.1 * nrow(diamonds)))

dat_testx <- diamonds %>% dplyr::slice(test_i) %>% select(-price)
dat_testy <- diamonds %>% dplyr::slice(test_i) %>% select(price)
dat_train <- diamonds[-test_i, ]

names(dat_train)

fit <- lm(price ~ ., data = dat_train)

summary(fit)

predict.lm(fit, newdata = dat_testx[2, ])

saveRDS(dat_testx, file = here::here(".notes", "testx.RDS"))
saveRDS(dat_testy, file = here::here(".notes", "testy.RDS"))
saveRDS(fit, file = here::here(".notes", "model.RDS"))

