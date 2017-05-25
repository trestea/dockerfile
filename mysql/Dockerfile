FROM docker.wanttreasure.com/kube/centos6.7:ssh
MAINTAINER mysql-5.6.36
ENV PASSWORD=zigeng@2016
RUN wget http://repo.mysql.com/mysql-community-release-el6.rpm && rpm -ivh mysql-community-release-el6.rpm && rm -f mysql-community-release-el6.rpm  && yum install -y mysql-server && yum clean all && rm -f /etc/my.cnf
COPY my.cnf /etc
COPY run.sh /usr/local
RUN chmod +x /usr/local/run.sh
VOLUME ["/var/lib/mysql"]
EXPOSE 3306
CMD ["/usr/local/run.sh"]
