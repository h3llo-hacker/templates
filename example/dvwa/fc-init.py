#!/usr/bin/python
import httplib
import urllib
import time
import os

print "chmod 777 /app -R"
# chmod 777 /app -R
os.system("chmod 777 /app -R")

# config config
DB_SERVER = os.getenv("DB_SERVER","db")
DB_USER = os.getenv("DB_USER","root")
DB_PASSWORD = os.getenv("DB_PASSWORD","password")
os.system('sed -i "s/DB_SERVER/'+DB_SERVER+'/g" /app/config/config.inc.php')
os.system('sed -i "s/DB_USER/'+DB_USER+'/g" /app/config/config.inc.php')
os.system('sed -i "s/DB_PASSWORD/'+DB_PASSWORD+'/g" /app/config/config.inc.php')

print "starting supervisord"
# /usr/bin/supervisord
os.system("/usr/bin/supervisord -c /etc/supervisord.conf")

print "sleep 5s"
for x in xrange(1,5):
	time.sleep(1)
	print 5-x

HOST = "127.0.0.1:80"
while 1:
	time.sleep(5)
	conn = httplib.HTTPConnection(HOST)
	conn.request("GET", "/setup.php")
	r1 = conn.getresponse()
	if r1.status == 200:
		conn.close()
		print "web OK"
		params = urllib.urlencode({"create_db": 1})
		headers = {"Content-type": "application/x-www-form-urlencoded",
			"Accept": "text/plain"}
		conn = httplib.HTTPConnection(HOST)
		conn.request("POST", "/setup.php", params, headers)
		r2 = conn.getresponse()
		if r2.status == 200:
			conn.close()
			print "Setup OK"
			break

# tail -f /var/log/supervisord.log
os.system("tail -f /var/log/supervisord.log")