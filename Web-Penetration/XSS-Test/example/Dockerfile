FROM alpine:latest
MAINTAINER wrfly <mr.wrfly@gmail.com>

# Install PHP
RUN apk --update add php7 php7-pdo_mysql php7-mysqli

EXPOSE 80

COPY app /app
COPY fc-init.sh /
RUN chmod +x fc-init.sh
CMD ["/fc-init.sh"]
