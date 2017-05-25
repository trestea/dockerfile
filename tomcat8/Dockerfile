FROM docker.wanttreasure.com/kube/centos6.7:jdk1.8.73
MAINTAINER  java-1.8-tomcat8
ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
ENV opts '-server -Xms256m -Xmx256m -Xss256k -XX:PermSize=128M -XX:MaxNewSize=256m -XX:MaxPermSize=256m'
ENV JAVA_OPTS '$opts -XX:SurvivorRatio=1 -XX:MaxTenuringThreshold=10 -XX:+AggressiveOpts -XX:+UseFastAccessorMethods -XX:+UseBiasedLocking -XX:+UseParNewGC -XX:+UseConcMarkSweepGC  -XX:CMSInitiatingOccupancyFraction=80 -XX:SoftRefLRUPolicyMSPerMB=0 -XX:+UseCMSCompactAtFullCollection $disconf'
WORKDIR $CATALINA_HOME
COPY tomcat /usr/local/tomcat
VOLUME ["/usr/local/tomcat/webapps"]
EXPOSE 8080
CMD ["catalina.sh", "run"]
