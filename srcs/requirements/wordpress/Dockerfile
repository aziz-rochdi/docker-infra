FROM debian:bullseye-slim

ARG WORDPRESS_URL

ENV PHP_FPM_PORT=${PHP_FPM_PORT}

RUN apt-get update && apt-get install -y \
    curl \
    php7.4 \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-curl \
    php7.4-gd \
    php7.4-json \
    php7.4-mbstring \
    php7.4-opcache \
    php7.4-xmlrpc

RUN mkdir -p /var/www/html \
    && curl -o /tmp/wordpress.tar.gz ${WORDPRESS_URL} \
    && tar -xzf /tmp/wordpress.tar.gz -C /tmp \
    && mv /tmp/wordpress/* /var/www/html \
    && chown -R www-data:www-data /var/www/html \
    && rm /tmp/wordpress.tar.gz \
    && rmdir /tmp/wordpress 

RUN sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.4/fpm/pool.d/www.conf


RUN mkdir -p /run/php

RUN chmod 755 /run/php

EXPOSE ${PHP_FPM_PORT}

WORKDIR /var/www/html

COPY ./conf/wp-config-sample.php wp-config.php

CMD ["php-fpm7.4", "-F"]
