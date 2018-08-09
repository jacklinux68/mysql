#!/bin/bash

date=`date +"%y-%m-%d"`
#mysqldump -uroot -p123 -S /app/mysql/tmp/mysql.sock -B abc --single-transaction | gzip > /root/bak/abc_"$date".sql.gz
mysqldump -uroot -p123 -S /app/mysql/tmp/mysql.sock -A -B --flush-privileges --single-transaction --master-data=2 --flush-logs --triggers --routines --events --hex-blob |gzip > /root/bak/all_"$date".sql.gz
sleep 1

scp /root/bak/all_"$date".sql.gz root@47.100.162.33:/root/bak/all_"$date".sql.gz &>/dev/null

rm -rf /root/bak/*

