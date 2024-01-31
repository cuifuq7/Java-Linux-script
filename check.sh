#!/usr/bin/env bash

source /etc/profile
source /etc/profile


echo 'Java安装完成，版本信息------------------------------------------------------'
java -version
echo '-'
echo '-'
echo '-'


echo 'git安装完成，版本信息------------------------------------------------------'
git --version
echo '-'
echo '-'
echo '-'


echo 'maven安装完成，版本信息------------------------------------------------------'
mvn -v
echo '-'
echo '-'
echo '-'


echo 'redis安装完成，版本信息------------------------------------------------------'
redis-server -v
ps aux|grep redis
echo '-'
echo '-'
echo '-'


echo 'mysql安装完成，版本信息------------------------------------------------------'
mysql -V
echo '-'
echo '-'
echo '-'




