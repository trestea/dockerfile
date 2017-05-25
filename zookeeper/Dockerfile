FROM centos6.7:jdk1.7.76
ENV ZOOKEEPER_VERSION 3.4.6
EXPOSE 2181 2888 3888

RUN yum install tar -y && yum clean all && wget -q -O - http://apache.mirrors.pair.com/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/zookeeper-${ZOOKEEPER_VERSION}.tar.gz | tar -xzf - -C /usr/local \
    && mv /usr/local/zookeeper-${ZOOKEEPER_VERSION} /usr/local/zookeeper \
    && cp /usr/local/zookeeper/conf/zoo_sample.cfg /usr/local/zookeeper/conf/zoo.cfg \
    && mkdir -p /usr/local/zookeeper/{data,log}

WORKDIR /usr/local/zookeeper
VOLUME ["/usr/local/zookeeper/conf", "/usr/local/zookeeper/data", "/usr/local/zookeeper/log"]

COPY config-and-run.sh ./bin/
RUN chmod +x ./bin/*.sh
COPY zoo.cfg ./conf/

CMD ["/usr/local/zookeeper/bin/config-and-run.sh"]
