#!/usr/bin/env bash

echo "---maven 安装---"

wget -i -c  https://mirrors.tuna.tsinghua.edu.cn/apache/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz
tar -zxvf apache-maven-3.9.4-bin.tar.gz

cd  /opt/tools/apache-maven-3.9.4/bin
sleep 1

chmod 777 mvn 

##配置maven环境变量
echo '##maven环境变量' >> /etc/profile
echo 'export MAVEN_HOME=/opt/tools/apache-maven-3.9.4' >> /etc/profile
echo 'export PATH=$MAVEN_HOME/bin:$PATH' >> /etc/profile

sleep 1

source /etc/profile

sleep 1
echo '------------------'
echo "apache-maven-3.9.4 安装完成，版本信息"
echo '------------------'
mvn -v

source /etc/profile

echo "maven安装完成，请更换 目录：/opt/tools/apache-maven-3.9.4/conf>  settings.xml 文件"

source /etc/profile


