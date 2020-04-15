pull the plumber container: `docker pull trestletech/plumber`

run the default app in the container: ` docker run --rm -p 8000:8000 trestletech/plumber`

```
docker run tells Docker to run a new container
--rm tells Docker to clean-up after the container when it’s done
-p 8000:8000 says to map port 8000 from the plumber container (which is where we’ll run the server) to port 8000 of your local machine
trestletech/plumber is the name of the image we want to run

-t name/name to specify custom name
```

look at the API work: `http://localhost:8000/mean`


see what's running `docker ps -a`

Example json:

[{"carat":0.53,"cut":"Premium","color":"D","clarity":"SI1","depth":61,"table":58,"x":5.18,"y":5.22,"z":3.17}]

curl -X GET "http://127.0.0.1:9302/predict?new_dat=%5B%7B%22carat%22%3A0.53%2C%22cut%22%3A%22Premium%22%2C%22color%22%3A%22D%22%2C%22clarity%22%3A%22SI1%22%2C%22depth%22%3A61%2C%22table%22%3A58%2C%22x%22%3A5.18%2C%22y%22%3A5.22%2C%22z%22%3A3.17%7D%5D" -H  "accept: application/json"

## Dockerfile

https://hub.docker.com/r/trestletech/plumber/dockerfile

docker build --rm -t my_plumber_api .

docker images

docker run --rm -p 8000:8000 my_plumber_api

## Stop and remove all running containers

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

## docker-compose

docker-compose -f docker-compose.yml up -d --no-recreate
