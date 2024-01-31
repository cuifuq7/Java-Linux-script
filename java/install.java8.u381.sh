#!/usr/bin/env bash

echo '---请下载对应的jdk, 文件后缀.rpm---'
echo '---jdk下载地址：https://www.oracle.com/java/technologies/downloads/#java8'
echo '---百度云盘地址: https://pan.baidu.com/s/1VOu29BCpujzeOLoeAmTD2Q?pwd=k6nd'

rpm -ivh jdk-8u381-linux-x64.rpm 

sleep 1

echo '##java环境变量' >> /etc/profile
echo 'export JAVA_HOME=/usr/java/jdk1.8.0-x64' >> /etc/profile
echo 'export PATH=$JAVA_HOME/bin:$PATH' >> /etc/profile
echo 'export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar' >> /etc/profile

sleep 1
source /etc/profile
sleep 1

echo '------------------'
echo 'Java安装完成，版本信息：'
echo '------------------'
java -version
