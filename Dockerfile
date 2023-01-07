FROM ubuntu:20.04
ENV TZ=Europe/Kiev
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install Apache and the required packages
RUN apt-get update && apt-get install -y apache2

# Set the working directory to the Apache document root
WORKDIR /var/www/html

# Expose port 80 for the Apache web server
EXPOSE 80

# Start Apache in the foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]