#!/usr/bin/env bash



echo "正在执行mysql数据库卸载程序"

#查询系统 MySQL 版本
rpm -qa | grep -i mysql

#关闭mysql服务
service mysqld stop


#卸载并删除MySQL安装的组键服务
rm -rf /var/lib/mysq
rm -rf /etc/my.cnf

#查看Mysql对应的文件
find / -name mysql

rm -rf /var/lib/mysql
rm -rf /var/lib/mysql/mysql
rm -rf /usr/lib64/mysql
rm -rf /usr/bin/mysql
rm -rf /usr/share/mysql
rm -rf /etc/logrotate.d/mysql
rm -rf /etc/selinux/targeted/active/modules/100/mysql


echo "完成mysql数据库卸载程序"
