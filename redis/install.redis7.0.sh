#!/usr/bin/env bash

echo "---redis-7.0.0 安装---"

wget -i -c  http://download.redis.io/releases/redis-7.0.0.tar.gz
tar xzf redis-7.0.0.tar.gz

sleep 1
cd redis-7.0.0
sleep 1
make

make install PREFIX=/usr/local/redis

cd /usr/local/redis/bin/
sleep 1

echo '------------------'
echo '------------------'
echo "redis-7.0.0 安装完成，已经启动"
echo '------------------'
./redis-server /opt/tools/redis-7.0.0/redis.conf &

