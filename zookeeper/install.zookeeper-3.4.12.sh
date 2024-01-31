#!/usr/bin/env bash

echo "---apache-zookeeper-3.4.12---安装---"

wget -i -c  https://archive.apache.org/dist/zookeeper/zookeeper-3.4.12/zookeeper-3.4.12.tar.gz
tar -zxvf zookeeper-3.4.12.tar.gz

cd /opt/tools/zookeeper-3.4.12/conf

cp -r zoo_sample.cfg zoo.cfg

sleep 1

cd /opt/tools/zookeeper-3.4.12/bin

echo "---apache-zookeeper-3.4.12---启动---"

 ./zkServer.sh restart
 

 sleep 1
 echo "---apache-zookeeper-3.4.12---状态---"

 
 ./zkServer.sh status


 
 
 
##查看通过防火墙的端口：
# firewall-cmd --zone=public --list-ports

##开启2181端口: 出现success表明添加成功
##firewall-cmd --zone=public --add-port=2181/tcp --permanent 

##重启防火墙 
##systemctl restart firewalld.service




