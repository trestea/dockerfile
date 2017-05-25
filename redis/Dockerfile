FROM centos6.7:ssh
MAINTAINER  redis-2.8.21 
COPY ./redis /opt/redis
RUN yum install -y gcc tcl gcc-c++ && cd /opt/redis && make && make install && rm -rf /opt/redis && mkdir -p /data/redis/{logs,data} && mkdir -p /etc/redis/conf && yum clean all
COPY ./redis.conf /etc/redis/conf
COPY run.sh /usr/local/run.sh
RUN chmod +x /usr/local/run.sh
VOLUME ["/etc/redis/conf", "/data/redis/data", "/data/redis/logs"]
EXPOSE 6379
CMD ["/usr/local/run.sh"]
