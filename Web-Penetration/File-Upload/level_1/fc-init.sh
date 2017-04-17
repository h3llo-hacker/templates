#!/bin/sh

echo "Inject Flag String..."
ENV_FILE="/app/env.php"
echo "<?php" > $ENV_FILE
# putenv('APPLICATION_ENV=staging');
# FLAG_ENV=$(env | grep FLAG)
echo "putenv(\"$(env | grep FLAG)\");" >> $ENV_FILE

cd /app

echo 
echo "Running Server..."

mkdir /run/apache2
chown apache:apache /app -R

rm -rf /var/www/localhost/htdocs
ln /app /var/www/localhost/htdocs -sf

# ln -sf /var/log/apache2/error.log /dev/stderr
# ln -sf /var/log/apache2/error.log /dev/stdout

exec /usr/sbin/httpd -D FOREGROUND