FROM centos6.7:jdk1.7.76
ENV ZOOKEEPER_IP=zookeeper
COPY ./dubbo /usr/local/dubbo
VOLUME ["/opt/data"]
COPY run.sh /usr/local
RUN chmod 755 /usr/local/dubbo/bin/*.sh && chmod 755 /usr/local/run.sh
CMD ["/usr/local/run.sh"]
EXPOSE 8888
