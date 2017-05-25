FROM centos6.7:ssh
RUN yum install pcre-devel gcc gcc-c++ openssl-devel -y && yum clean all && chmod +x /usr/local/*.sh && groupadd -r www && useradd -r -g www www && cd /usr/local/nginx-1.12.0  && ./configure --prefix=/usr/local/nginx --user=www --group=www --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-http_sub_module && make && make install && rm -rf /usr/local/nginx-1.12.0
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
	&& ln -sf /dev/stderr /var/log/nginx/error.log
