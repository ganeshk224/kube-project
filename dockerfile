FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

# Install Apache, unzip, and zip
RUN apt-get update && \
    apt-get install -y apache2 zip unzip && \
    apt-get clean

# Download the website template
ADD https://templatemo.com/download/templatemo_554_ocean_vibes /var/www/html/templatemo_554_ocean_vibes.zip

WORKDIR /var/www/html/

# Unzip and move files
RUN unzip templatemo_554_ocean_vibes.zip && \
    cp -rvf templatemo_554_ocean_vibes/* . && \
    rm -rf templatemo_554_ocean_vibes templatemo_554_ocean_vibes.zip

# Expose HTTP port
EXPOSE 80

# Start Apache in foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]