#!/usr/bin/env bash

echo "---git---安装---"

yum install git -y

sleep 1



echo '------------------'
echo 'git安装完成，版本信息：'
echo '------------------'
git --version
sleep 1


echo '------------------'
echo 'git clone 免密码设置：'
echo '第一步：git config --global user.name "你的账号"'
echo '第	二步：git config --global credential.helper store'
echo '------------------'





