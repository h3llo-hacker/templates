FROM alpine:latest
MAINTAINER wrfly <mr.wrfly@gmail.com>

# Install MySQL
RUN apk --update add mysql && \
    mysql_install_db && \
    sed -i "s/mysqld\/mysqld.sock/mysqld.sock/" \
    /etc/mysql/my.cnf && \
    rm -rf /var/lib/mysql/ib*

# Install PHP
RUN apk add php5 php5-pdo_mysql php5-mysqli && \
	sed -i "s/track_errors\ =\ Off/track_errors\ =\ On/g" /etc/php5/php.ini && \
	sed -i "s/display_errors\ =\ Off/display_errors\ =\ On/g" /etc/php5/php.ini

COPY my.cnf /etc/my.cnf

EXPOSE 80

COPY app /app
COPY fc-init.sh /
RUN chmod +x fc-init.sh
CMD ["/fc-init.sh"]
