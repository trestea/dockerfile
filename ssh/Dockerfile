FROM centos:6.7
RUN yum -y install wget tar && wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo && wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo && yum install -y openssh-server && echo "root:zigeng@2016" | chpasswd && /etc/init.d/sshd start && yum clean all && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
