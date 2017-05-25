#! /bin/bash
/usr/sbin/sshd & httpd -D FOREGROUND & /usr/local/php/sbin/php-fpm -y /usr/local/php/etc/php-fpm.conf -F
