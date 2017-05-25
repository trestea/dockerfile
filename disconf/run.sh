#!/bin/bash

if [ ! -z "$MYSQL_IP" ] && [ ! -z "$MYSQL_USER" ] && [ ! -z "$MYSQL_PASS" ] && [ ! -z "$REDIS_IP" ] && [ ! -z "$REDIS_PORT" ] && [ ! -z "$ZOOKEEPER_IP" ]; then
sed -i 's/MYSQL_IP/'$MYSQL_IP'/g' /usr/local/tomcat/webapps/disconf-web/WEB-INF/classes/jdbc-mysql.properties
sed -i 's/MYSQL_USER/'$MYSQL_USER'/g' /usr/local/tomcat/webapps/disconf-web/WEB-INF/classes/jdbc-mysql.properties
sed -i 's/MYSQL_PASS/'$MYSQL_PASS'/g' /usr/local/tomcat/webapps/disconf-web/WEB-INF/classes/jdbc-mysql.properties
sed -i 's/REDIS_IP/'$REDIS_IP'/g' /usr/local/tomcat/webapps/disconf-web/WEB-INF/classes/redis-config.properties
sed -i 's/REDIS_PORT/'$REDIS_PORT'/g' /usr/local/tomcat/webapps/disconf-web/WEB-INF/classes/redis-config.properties
sed -i 's/ZOOKEEPER_IP/'$ZOOKEEPER_IP'/g' /usr/local/tomcat/webapps/disconf-web/WEB-INF/classes/zoo.properties
fi

/usr/local/nginx/sbin/nginx & /usr/local/tomcat/bin/catalina.sh run
