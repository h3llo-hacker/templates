#!/bin/sh
FLAG=$(env | grep FLAG | sed "s/.*=//g")
if [[ "$FLAG" == "" ]]; then
	export FLAG="flag{h3llo-world}"
fi

ENV_FILE="/app/env.php"
echo "<?php" > $ENV_FILE

# putenv('APPLICATION_ENV=staging');

# FLAG_ENV=$(env | grep FLAG)
echo "putenv(\"$(env | grep FLAG)\");" >> $ENV_FILE

NUM=$(date +%s | tail -c 4)
PASS=$(head -n $NUM /top_1000.txt| tail -1)
echo "Password: $PASS"
export PASSWD=$PASS

echo "putenv(\"$(env | grep PASSWD)\");" >> $ENV_FILE

cd /app && php -S 0.0.0.0:80