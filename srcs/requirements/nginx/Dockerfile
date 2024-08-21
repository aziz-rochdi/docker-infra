FROM alpine:latest

RUN apk update

RUN apk add --no-cache nginx

COPY ./conf/ /etc/nginx/

COPY ./conf/ssl/nginx.crt /etc/ssl/certs/nginx.crt
COPY ./conf/ssl/nginx.key /etc/ssl/private/nginx.key

EXPOSE ${NGINX_PORT}

CMD ["nginx", "-g", "daemon off;"]