FROM centos6.7:python2.7
RUN yum install -y openssh-server && echo "root:zigeng@2016" | chpasswd && /etc/init.d/sshd start && yum clean all && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
