FROM debian:latest
FROM drupal:latest

# Määrake töökeskkond
WORKDIR /var/www/html

# Installige vajalikud laiendused
RUN apt-get update && apt-get install -y \
    libmysqlclient28 \
    php-mysqlnd \
    mariadb-server

# Koopige veebisaidi failid konteinerisse
COPY . .

# Käivitage veebiserver
CMD ["apache2-ctl", "-f", "/etc/apache2/apache2.conf"]