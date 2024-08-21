# Use Debian as the base image
FROM debian:bullseye-slim

ARG ADMINER_SOURCE

ENV ADMINER_PORT=${ADMINER_PORT}

# Install necessary packages
RUN apt-get update && apt-get install -y \
    php-cli \
    php-mysqli \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create the directory for Adminer
RUN mkdir -p /var/www/html

# Download Adminer
RUN wget -O /var/www/html/index.php ${ADMINER_SOURCE}

# Set ownership and permissions
RUN chown -R www-data:www-data /var/www/html

# Expose the Adminer port
EXPOSE ${ADMINER_PORT}

# Start the Adminer PHP server
CMD ["php", "-S", "0.0.0.0:8080", "-t", "/var/www/html"]
