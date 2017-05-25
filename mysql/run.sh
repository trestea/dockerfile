#! /bin/bash
/etc/init.d/mysqld restart
mysql -e "grant all privileges on *.* to 'root'@'%' identified by '$PASSWORD';"
mysql -e "grant all privileges on *.* to 'root'@'localhost' identified by '$PASSWORD';"
/usr/sbin/sshd -D
