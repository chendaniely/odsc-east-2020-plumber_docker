library(httr)

# httr::GET()

http://161.35.52.255:8000/predict?new_dat=%5B%7B%22carat%22%3A0.53%2C%22cut%22%3A%22Premium%22%2C%22color%22%3A%22D%22%2C%22clarity%22%3A%22SI1%22%2C%22depth%22%3A61%2C%22table%22%3A58%2C%22x%22%3A5.18%2C%22y%22%3A5.22%2C%22z%22%3A3.17%7D%5D

res <- httr::GET(
  "http://localhost:8000/predict?new_dat=%5B%7B%22carat%22%3A0.53%2C%22cut%22%3A%22Premium%22%2C%22color%22%3A%22D%22%2C%22clarity%22%3A%22SI1%22%2C%22depth%22%3A61%2C%22table%22%3A58%2C%22x%22%3A5.18%2C%22y%22%3A5.22%2C%22z%22%3A3.17%7D%5D"
  )

res <- httr::GET(
  "http://localhost:8000/predict?new_dat=%5B%7B%22carat%22%3A0.53%2C%22cut%22%3A%22Premium%22%2C%22color%22%3A%22D%22%2C%22clarity%22%3A%22SI1%22%2C%22depth%22%3A61%2C%22table%22%3A58%2C%22x%22%3A5.18%2C%22y%22%3A5.22%2C%22z%22%3A3.17%7D%5D"
)

# httr::content()

dat <- jsonlite::fromJSON('[{"carat":0.53,"cut":"Premium","color":"D","clarity":"SI1","depth":61,"table":58,"x":5.18,"y":5.22,"z":3.17}]')

unlist(dat)
httr::GET(
  "http://127.0.0.1:8000/predict?new_dat=%5B%7B%22carat%22%3A0.53%2C%22cut%22%3A%22Premium%22%2C%22color%22%3A%22D%22%2C%22clarity%22%3A%22SI1%22%2C%22depth%22%3A61%2C%22table%22%3A58%2C%22x%22%3A5.18%2C%22y%22%3A5.22%2C%22z%22%3A3.17%7D%5D"
)

httr::GET('http://localhost:8000/predict -d {new_dat={"carat":0.53,"cut":"Premium","color":"D","clarity":"SI1","depth":61,"table":58,"x":5.18,"y":5.22,"z":3.17}}')

httr::content(res)



jsn <- '[{"carat":0.53,"cut":"Premium","color":"D","clarity":"SI1","depth":61,"table":58,"x":5.18,"y":5.22,"z":3.17}]'

json_body <- jsonlite::toJSON(dplyr::select(ggplot2::diamonds[100, ], -price))
httr::POST(
  url = "161.35.52.255:8000/predict",
  body = json_body)

"http://161.35.52.255:8000/predict" {"new_data":[{"carat":0.23,"cut":"Ideal","color":"E","clarity":"SI2","depth":61.5,"table":55,"price":326,"x":3.95,"y":3.98,"z":2.43}]}


curl -X GET 161.35.52.255:8000/predict --data-urlencode 'new_dat@one_diamond.json'

