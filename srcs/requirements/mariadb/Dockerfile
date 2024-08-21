FROM debian:bullseye-slim

ENV MARIADB_DATABASE=${MARIADB_DATABASE} \
    MARIADB_USER=${MARIADB_USER} \
    MARIADB_PASSWORD=${MARIADB_PASSWORD} \
    MARIADB_ROOT_PASSWORD=${MARIADB_ROOT_PASSWORD} \
    MARIADB_ROOT_USERNAME=${MARIADB_ROOT_USERNAME}

RUN apt-get update && apt-get install -y \
    mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY ./conf/init-db.sh /docker-entrypoint-initdb.d/

RUN chmod +x /docker-entrypoint-initdb.d/init-db.sh

RUN sed -i 's/^bind-address\s*=.*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE ${MARIADB_PORT}

CMD ["/bin/bash", "-c", "/docker-entrypoint-initdb.d/init-db.sh && mysqld_safe"]


