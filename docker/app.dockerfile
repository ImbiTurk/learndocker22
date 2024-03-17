FROM debian:latest 
RUN apt update && apt install -y php \
                                 curl \
                                 zip                               php-mysqli

EXPOSE 80

WORKDIR /var/www/html/

# RUN rm index.html

# RUN curl -o /wordpress.zip https://wordpress.org/latest.zip

# RUN unzip /wordpress.zip -d /
# RUN mv /wordpress/* .
# RUN chmod 777 .

# # RUN curl -o /drupal-10.2.4.zip https://www.drupal.org/download
# # RUN unzip /drupal-10.2.4.zip -d /
# # RUN mv /drupal-10.2.4/* .
# # RUN chmod 750 .
# # ADD index.php .


# # #ENTRYPOINT ["tail", "-f", "/dev/null"]
# CMD apachectl -D FOREGROUND
# # ENTRYPOINT [ "tail","-f","/dev/null"]
# FROM php:8.1-apache  # Use official PHP image with Apache pre-configured

# EXPOSE 80

# WORKDIR /var/www/html
FROM php:8.1-apache

EXPOSE 80

WORKDIR /var/www/html

# RUN apt update && apt install -y curl zip php-mysqli

# Lae Drupal ja ekstrahi see turvaliselt
RUN curl -o drupal.tar.gz https://www.drupal.org/download/latest/tar.gz && \
    tar -xzf drupal.tar.gz

# Seadista õigused
RUN chown -R www-data:www-data .

CMD ["apache2", "-f", "/etc/apache2/apache2.conf"]