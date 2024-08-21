#!/bin/bash
set -e

# Start MariaDB server in the background
mysqld_safe --skip-networking &

# Wait for MariaDB to start
until mysqladmin ping &>/dev/null; do
    sleep 1
done

# Create the custom root user and the database user
# mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_ROOT_USERNAME}'@'%' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
# mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MARIADB_ROOT_USERNAME}'@'%' WITH GRANT OPTION;"
# mysql -e "FLUSH PRIVILEGES;"
# mysql -e "DELETE FROM mysql.user WHERE User='root';"

mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';"
mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"

# Stop the background MariaDB server
mysqladmin shutdown
