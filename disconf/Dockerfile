FROM centos6.7:jdk1.7.76
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV JAVA_OPTS '-server -Xms128m -Xmx128m -Xss256k -XX:PermSize=128M'
ENV MYSQL_IP=disconf-mysql MYSQL_USER=disconf MYSQL_PASS=zieng@2016 REDIS_IP=disconf-redis REDIS_PORT=6379 ZOOKEEPER_IP=disconf-zookeeper
WORKDIR $CATALINA_HOME
COPY tomcat /usr/local/tomcat
COPY nginx-1.12.0 /usr/local/nginx-1.12.0
COPY run.sh /usr/local
RUN yum install pcre-devel gcc gcc-c++ openssl-devel -y && yum clean all && chmod +x /usr/local/*.sh && groupadd -r www && useradd -r -g www www && cd /usr/local/nginx-1.12.0  && ./configure --prefix=/usr/local/nginx --user=www --group=www --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-http_sub_module && make && make install && rm -rf /usr/local/nginx-1.12.0
COPY disconf-web /usr/local/nginx/html/disconf-web
COPY nginx.conf /usr/local/nginx/conf/nginx.conf
VOLUME ["/usr/local/tomcat/webapps"]
EXPOSE 80
CMD ["/usr/local/run.sh"]
