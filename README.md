# Installation Instructions

```{r, engine='bash', count_lines}
docker-machine create --driver virtualbox --virtualbox-disk-size "8000" booking_ms
eval "$(docker-machine env booking_ms)"
eval `docker-machine env 2>/dev/null`

docker build .
docker-compose build

docker-compose run web rails db:migrate
docker-compose run web rails db:seed
docker-compose up
```
