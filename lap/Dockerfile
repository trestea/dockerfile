FROM docker.wanttreasure.com/kube/centos6.7:ssh
COPY run.sh /usr/local
RUN yum install httpd httpd-devel recode-devel gcc gcc-c++ make cmake openssl-devel gd-devel* zlib-devel pcre-devel libxml2-devel curl-devel readline-devel libmcrypt libmcrypt-devel file glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel -y && yum clean all
RUN cp -frp /usr/lib64/libldap* /usr/lib/
COPY ./httpd.conf /etc/httpd/conf/
COPY ./php-7.0.9 /opt/php-7.0.9
RUN cd /opt/php-7.0.9 && ./configure \
--prefix=/usr/local/php \
--with-config-file-path=/usr/local/php/etc \
--with-mcrypt \
--with-mhash \
--with-mysqli=mysqlnd \
--with-pdo-mysql=mysqlnd \
--with-gd \
--with-iconv \
--with-zlib \
--with-curl \
--with-jpeg-dir \
--with-freetype-dir \
--with-apxs2=/usr/sbin/apxs \
--with-openssl \
--with-xmlrpc \
--with-bz2 \
--with-gettext \
--with-readline \
--with-recode \
--with-fpm-user=apache \
--with-fpm-group=apache \
--enable-fpm \
--enable-cgi \
--enable-xml \
--enable-bcmath \
--enable-inline-optimization \
--enable-mbregex \
--enable-mbstring \
--enable-ftp \
--enable-gd-native-ttf \
--enable-pcntl \
--enable-sockets \
--enable-sysvmsg \
--enable-sysvshm \
--enable-shmop \
--enable-zip \
--enable-soap \
--enable-session \
--enable-opcache \
--enable-cli && make; make install && rm -rf /opt/php-7.0.9
COPY ./phpredis-php7 /opt/phpredis-php7
RUN cd /opt/phpredis-php7 && /usr/local/php/bin/phpize && ./configure --with-php-config=/usr/local/php/bin/php-config && make && make install && rm -rf /opt/phpredis-php7 && chmod 755 /usr/local/run.sh
COPY ./etc /usr/local/php/etc
EXPOSE 80
CMD ["/usr/local/run.sh"]
