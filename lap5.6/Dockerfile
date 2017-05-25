FROM docker.wanttreasure.com/kube/centos6.7:ssh
COPY run.sh /usr/local
RUN yum install -y  libxml2-devel jpeg-devel png-devel freetype-devel gd-devel openssl-devel bzip2-devel libmcrypt-devel libxml2-devel openssl-devel libcurl-devel libjpeg-devel libpng-devel libicu-devel openldap-devel gcc gcc-c++ httpd httpd-devel libjpeg libpng && yum clean all
COPY ./httpd.conf /etc/httpd/conf/
COPY ./php-5.6.30 /opt/php-5.6.30
RUN cd /opt/php-5.6.30 && ./configure --prefix=/usr/local/php\
 --with-config-file-path=/usr/local/php/etc\
 --with-apxs2=/usr/sbin/apxs\
 --with-libdir=lib64\
 --enable-fpm\
 --with-fpm-user=apache\
 --with-fpm-group=apache\
 --enable-mysqlnd\
 --with-mysql=mysqlnd\
 --with-mysqli=mysqlnd\
 --with-pdo-mysql=mysqlnd\
 --enable-opcache\
 --enable-pcntl\
 --enable-mbstring\
 --enable-soap\
 --enable-zip\
 --enable-calendar\
 --enable-bcmath\
 --enable-exif\
 --enable-ftp\
 --enable-intl\
 --with-openssl\
 --with-zlib\
 --with-curl\
 --with-gd\
 --with-zlib-dir\
 --with-png-dir\
 --with-jpeg-dir\
 --with-gettext\
 --with-mhash\
 --with-ldap && make; make install && rm -rf /opt/php-5.6.30
COPY ./php.ini /usr/local/php/etc
COPY ./php-fpm.conf /usr/local/php/etc
COPY ./php-fpm /etc/init.d/php-fpm
RUN chmod 755 /etc/init.d/php-fpm /usr/local/run.sh
VOLUME ["/var/www/html"]
EXPOSE 80
CMD ["/usr/local/run.sh"]
