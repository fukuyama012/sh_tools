#!/bin/sh
# * backup mysql db and make encryption zip file
# * @license my_dump v0.0.1
# * License: MIT

# MySQLユーザ名
mysql_user=xxxDBUser
# MySQLパスワード
mysql_pw=xxxpass
# バックアップするデータベース名
mysql_db_name=xxxDB
# バックアップ先
save_dir=/home/xxx/sqldump/
# バックアップファイルを残す数
max_save_count=15
# バックアップファイル名
backup_name="SQL"`date +"%Y-%m%d-%H%M%S"`

mysqldump -u $mysql_user --password=$mysql_pw $mysql_db_name > $save_dir$backup_name
zip -P `cat pw.txt` $save_dir$backup_name.zip $save_dir$backup_name
chmod 700 $save_dir$backup_name.zip
rm -f $save_dir$backup_name

file_count=`ls -F1 $save_dir | grep -v / | wc -l`
if [ $file_count -gt $max_save_count ]
then
    rm -f $save_dir`ls -F1tr $save_dir | grep -v / | head -1`
fi

