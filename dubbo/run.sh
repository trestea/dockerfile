#! /bin/bash
if [ ! -z "$ZOOKEEPER_IP" ]; then
sed -i 's/ZK_IP/'$ZOOKEEPER_IP'/g' /usr/local/dubbo/conf/dubbo.properties
fi
/usr/local/dubbo/bin/start.sh & /usr/sbin/sshd -D
