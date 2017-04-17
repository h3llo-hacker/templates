FROM alpine:latest
MAINTAINER wrfly <mr.wrfly@gmail.com>

# Install PHP & Apache2
RUN apk --update add apache2 php5-apache2

EXPOSE 80

COPY server.conf /etc/apache2/conf.d/
COPY app /app
COPY fc-init.sh /
RUN chmod +x fc-init.sh
CMD ["/fc-init.sh"]
