# 关闭防火墙
systemctl stop firewalld
# 查看防火墙状态
systemctl status firewalld

echo '---mount---安装nfs-utils ---' 
yum install nfs-utils
yum install rpcbind


echo '---mount---启动服务 ---' 
systemctl restart rpcbind
systemctl restart nfs



mkdir -p /data


echo '##挂载文件## start' >> /etc/exports
echo '/data *(rw,sync,no_root_squash)' >> /etc/exports
echo '##挂载文件## end' >> /etc/exports


#showmount -e

echo '----mount---挂载列表---' 
exportfs -rv


echo '----请在客户端执行命令---' 
echo 'mkdir -p /data'
echo 'yum install nfs-utils'
echo 'mount -t nfs 服务端IP:/data /data'
echo '----请在客户端执行以上命令---' 


yum install nfs-utils

mkdir -p /data
mount -t nfs 192.168.0.51:/data /data