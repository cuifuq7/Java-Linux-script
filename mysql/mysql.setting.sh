#!/bin/bash

# close selinux
if [ -f "/etc/my.cnf" ]; then
  echo "mysql setting completed! exit~~"
  exit 0
fi
# change data-home to /data/mysql
service mysql stop
mkdir -p /data/mysql
cp -r /var/lib/mysql/* /data/mysql
chown -R mysql:mysql /data/mysql
#为/data/mysql/mysql.sock建立指向/var/lib/mysql/mysql.sock的软连接
ln -s /data/mysql/mysql.sock /var/lib/mysql/mysql.sock

# setting main configuration file
mv /usr/my.cnf /etc/
echo "skip-show-database=ON" >> /etc/my.cnf
echo "lower_case_table_names=1" >> /etc/my.cnf
echo "character-set-server=utf8" >> /etc/my.cnf
echo "datadir = /data/mysql" >> /etc/my.cnf
echo "socket = /data/mysql/mysql.sock" >> /etc/my.cnf
echo "user = mysql" >> /etc/my.cnf
service mysql start
echo "迁移数据目录和基础配置 完成"
