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

php5 -S 0.0.0.0:80 &> /dev/null