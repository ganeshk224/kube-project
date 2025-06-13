FROM centos:8

# Install Apache (httpd), unzip, and zip
RUN dnf install -y httpd zip unzip curl net-tools && \
    dnf clean all

# Download the website template
ADD https://templatemo.com/download/templatemo_554_ocean_vibes /var/www/html/templatemo_554_ocean_vibes.zip

WORKDIR /var/www/html/

# Unzip and move files
RUN unzip templatemo_554_ocean_vibes.zip && \
    cp -rvf templatemo_554_ocean_vibes/* . && \
    rm -rf templatemo_554_ocean_vibes templatemo_554_ocean_vibes.zip

# Expose HTTP port
EXPOSE 80

# Start Apache (httpd) in foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]