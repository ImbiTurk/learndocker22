FROM debian:latest

RUN apt update && apt install -y php \
                                curl \
                                zip \
                                php-mysqli

EXPOSE 80

WORKDIR /var/www/html/

RUN rm index.html

RUN curl -o /wordpress.zip https://wordpress.org/latest.zip

RUN unzip /wordpress.zip -d /
RUN mv /wordpress/* .
RUN chmod 777 .
# ADD index.php .


#ENTRYPOINT ["tail", "-f", "/dev/null"]
CMD apachectl -D FOREGROUND