FROM alpine:latest

RUN apk update && apk add --no-cache redis

EXPOSE ${REDIS_PORT}

CMD ["redis-server", "--protected-mode", "no"]
