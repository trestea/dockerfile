FROM centos6.7:jdk1.7.76
MAINTAINER  java-1.7-tomcat7
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/apr/lib
ENV disconf ''
ENV opts '-server -Xms256m -Xmx256m -Xss256k -XX:PermSize=128M -XX:MaxNewSize=256m -XX:MaxPermSize=256m'
ENV JAVA_OPTS '$opts -XX:SurvivorRatio=1 -XX:MaxTenuringThreshold=10 -XX:+AggressiveOpts -XX:+UseFastAccessorMethods -XX:+UseBiasedLocking -XX:+UseParNewGC -XX:+UseConcMarkSweepGC -XX:+PrintFlagsFinal -XX:+PrintGCDetails -XX:CMSInitiatingOccupancyFraction=80 -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+UseCMSCompactAtFullCollection $disconf'
WORKDIR $CATALINA_HOME
COPY tomcat /usr/local/tomcat
COPY tomcat-native-1.1.33-src /usr/local/tomcat-native-1.1.33-src
RUN yum install apr-util-devel gcc-c++ -y && yum clean all && cd /usr/local/tomcat-native-1.1.33-src/jni/native && ./configure --with-apr=/usr/bin/apr-1-config --with-java-home=/usr/local/jdk1.7.0_76 && make && make install
VOLUME ["/usr/local/tomcat/webapps"]
EXPOSE 8080
CMD ["catalina.sh", "run"]
