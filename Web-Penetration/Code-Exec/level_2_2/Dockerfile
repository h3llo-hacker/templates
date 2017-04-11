FROM alpine:latest
MAINTAINER wrfly <mr.wrfly@gmail.com>

# Install PHP
RUN apk --update add php5

EXPOSE 80

COPY app /app
COPY fc-init.sh /
RUN chmod +x fc-init.sh
CMD ["/fc-init.sh"]
