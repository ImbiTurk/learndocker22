FROM httpd:2.4

RUN apt update && apt install -y nano

ADD httpd.conf /usr/local/apache2/conf/

ADD html/* /user/local/apache2/htdocs