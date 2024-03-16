FROM httpd:2.4

RUN apt update && apt install -y nano

ADD httpd.conf /usr/local/apache2/conf/

<<<<<<< HEAD
ADD html/* /user/local/apache2/htdocs
=======
ADD html/* /usr/local/apache2/htdocs

>>>>>>> fba3c6899634d1b643b153d2f1e89e6b6575786c
