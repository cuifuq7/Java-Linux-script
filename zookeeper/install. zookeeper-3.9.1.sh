#!/usr/bin/env bash

echo "---apache-zookeeper-3.9.1---安装---"

wget -i -c  https://archive.apache.org/dist/zookeeper/zookeeper-3.9.1/apache-zookeeper-3.9.1.tar.gz
tar -zxvf apache-zookeeper-3.9.1.tar.gz

cd /opt/tools/apache-zookeeper-3.9.1/conf

cp -r zoo_sample.cfg zoo.cfg

sleep 1

cd /opt/tools/apache-zookeeper-3.9.1/bin

 ./zkServer.sh restart

tar -xvf nacos-server-2.3.0.tar


echo "nacos2.3.0 解压完成，请更换或配置文件目录：/opt/tools/nacos/conf >  application.properties 文件"

echo " 
###--------- nacos2.3.0 鉴权配置---------
nacos.core.auth.system.type=nacos
nacos.core.auth.enabled=true
nacos.core.auth.server.identity.key=nacos23
nacos.core.auth.server.identity.value=nacos23
nacos.core.auth.plugin.nacos.token.secret.key=自己设置的字符串Base64编码(注意原字符串长度大于32)

###--------- nacos2.3.0 数据库配置 ---------
spring.datasource.platform=mysql
db.url.0=jdbc:mysql://127.0.0.1:3306/nacos?characterEncoding=utf8&connectTimeout=1000&socketTimeout=3000&autoReconnect=true&useUnicode=true&useSSL=false&serverTimezone=UTC
db.user.0=root
db.password.0=123456
"

cd  /opt/tools/nacos/bin
sleep 1

echo '启动命令(standalone代表着单机模式运行，非集群模式): sh startup.sh -m standalone'
echo '当前运行-非集群模式'
sh startup.sh -m standalone
echo '当前运行-非集群模式'
sleep 1


tail /opt/tools/nacos/logs/start.out -f





