# Use an official PHP runtime as a parent image
FROM php:7.4-apache

RUN apt-get update && apt upgrade -y
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli
# Set the working directory to /var/www/html
WORKDIR /var/www/html

# Copy PHP files from the local directory to the container
COPY ./main/ /var/www/html/


# Expose port 80 for the web server
EXPOSE 80
EXPOSE 443


# Define environment variables for PHP
ENV MYSQL_HOST=localhost
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=password
ENV MYSQL_DATABASE=mydb

# Start Apache web server in the foreground
CMD ["apache2-foreground"]
