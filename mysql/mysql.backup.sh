#!/bin/bash
# mysql auto backup shell
# zhangpu

backup_db=1119
mysql_user=root
mysql_pswd='HI%94N$t$J'
mysql_host=192.168.0.150

dump_dir=/data/backup
dump_days=30
dump_bin=/usr/bin/mysqldump

date=$(date '+%Y%m%d-%H%M%S')
dump_file=$dump_dir/${backup_db}_$date.sql
dump_zip=$dump_dir/${backup_db}_$date.zip
remote_backup_file=/data/backup_remote/db/${backup_db}_$date.zip

# backup mysql database
date=$(date '+%Y%m%d')
cd $dump_dir
echo begin backup mysql
$dump_bin -h$mysql_host -u$mysql_user -p$mysql_pswd $backup_db --skip-lock-tables > $dump_file
echo finished backup mysql to $dump_file

# zip file
zip $dump_zip $dump_file
rm -fr $dump_file
echo finished compressed dump file to $dump_zip

cp $dump_zip $remote_backup_file

# clear expired backup file
find ${dump_dir} -type f -mtime +${dump_days} -name "*.zip" -exec rm {} \;
echo "finished clear expired backup,${dump_days} days ago"
