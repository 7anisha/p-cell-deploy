
FROM php:7.4-apache

RUN apt-get update && apt upgrade -y
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli

WORKDIR /var/www/html


COPY ./main/ /var/www/html/

EXPOSE 80
EXPOSE 443

ENV MYSQL_HOST=localhost
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=password
ENV MYSQL_DATABASE=mydb


CMD ["apache2-foreground"]
