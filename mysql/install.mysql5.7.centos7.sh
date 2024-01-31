#!/usr/bin/env bash

rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2022

wget -i -c http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
yum  localinstall mysql57-community-release-el7-10.noarch.rpm -y

sleep 1

yum install mysql-server -y
#!yum install mysql-community-server -y

sleep 1

service mysqld start

sleep 1
sudo chown mysql:mysql /var/log/mysqld.log
sleep 1

echo 'lower_case_table_names=1' >> /etc/my.cnf
echo 'validate_password_policy=0' >> /etc/my.cnf
echo 'validate_password_length=6' >> /etc/my.cnf
echo "character-set-server=utf8" >> /etc/my.cnf
echo "sql_mode=STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" >> /etc/my.cnf
echo "character-set-server=utf8" >> /etc/my.cnf


sleep 1

service mysqld restart

sleep 1

echo 'mysql安装完成，-------------------------------'
service mysqld status
echo '-'
echo '-'
echo '-'

sleep 1
echo '--更新新密码-方案1------针对mysql 5.7----------'
echo '------------------'
echo 'mysql安装完成，请更新新密码---'
echo '------------------'

DB_OLD_PSWD=`grep "A temporary password is generated for root@localhost" /var/log/mysqld.log |awk  -F 'localhost:'  '{print $2}'`
echo "mysql原root密码为：$DB_OLD_PSWD"
echo "下面修改原密码，请输入旧密码和新密码："
mysqladmin -uroot -p password

echo '--更新新密码-方案1----------------end'

echo '-'
echo '-'
echo '-'
echo '-'


echo '--更新新密码-方案2-----针对mysql 5.7----------'

echo '--命令：find / -name my.cnf  ,调整为 “无密码模式 ”'
echo '--命令：找到 [mysqld] 部分, skip-grant-tables ”'
echo '--命令：mysql -uroot -p  '
echo '--命令：use mysql;  '
echo '--命令：update user set authentication_string=password("123456"),Host="%" where User="root";  '
echo '--命令：exit  '
echo '--命令：删除 my.cnf 文件中 skip-grant-tables   '
echo '--命令：service mysqld restart'
echo '--更新新密码-方案2----------------end'
echo '-'
echo '-'
echo '-'
echo '-'


echo '--更新新密码-方案3-----针对mysql 5.7----------'
echo '--命令：mysql -uroot -p  '
echo '--命令：use mysql;  '
echo '--命令：set password =password('123456');'
echo '--更新新密码-方案3----------------end'



echo '--更新新密码-方案4------针对mysql 8.0-------------'
echo '--命令：mysql -uroot -p  '
echo '--命令：use mysql;  '
echo '--命令：SELECT user,authentication_string,plugin,host FROM mysql.user;'
echo "--命令：ALTER USER 'root'@'localhost' IDENTIFIED BY '123456';"
echo '--命令：FLUSH PRIVILEGES;'
echo '--更新新密码-方案4----------------end'

echo '-'
echo '-'
echo '-'
echo '-'


